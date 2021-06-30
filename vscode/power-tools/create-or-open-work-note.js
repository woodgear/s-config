
function getDate() {
    const date = new Date();
    return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`
}

function pad(num, n) {
    var len = num.toString().length;
    while (len < n) {
        num = "0" + num;
        len++;
    }
    return num;
}

function noteHeader() {
    const { crypto, log } = getEnv()
    const randomHex = crypto.randomBytes(4).toString('hex');
    const date = new Date();
    return `---
id: '${randomHex}',
time: ${date.getFullYear()}-${pad(date.getMonth() + 1, 2)}-${date.getDate()}T${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}+08:00',
---`
}


// https://stackoverflow.com/a/67535595
function weekInfo(date) {
    const day = date.getDate()
    const weekDay = date.getDay()
    let week = Math.round(day / 7)

    const ordinal = ["1", '2', '3', '4', '5']
    const weekDays = ['周日', '周一', '周二', '周三', '周四', '周五', '周六']

    return [`${ordinal[week]}`, `${weekDays[weekDay]}`]
}

// YYY/MM月/第X周/MMDD周N.md
function filePath() {
    const { os } = getEnv()
    const home = os.homedir()
    const date = new Date();
    const [week, day] = weekInfo(date)
    return `${home}/sm/ns/share/note/${date.getFullYear()}/${date.getMonth() + 1}月/第${week}周/${pad(date.getMonth() + 1, 2)}-${date.getDate()}-${day}.md`;
}


function writeFile(filePath, context) {
    const { log, path, fs } = getEnv()
    const dirname = path.dirname(filePath);
    fs.mkdirSync(dirname, { recursive: true })
    fs.writeFileSync(filePath, context)
}


function setEnv(power) {
    global.power = power
}

function getEnv() {
    if (global.power) {
        return {
            "log": (...args) => {
                const vscode = global.power.require("vscode")
                vscode.window.showInformationMessage([...args].join(" "))
            },
            "open": (filePath) => {
                const vscode = global.power.require("vscode")
                const url = vscode.Uri.parse('file://' + filePath);
                vscode.commands.executeCommand('vscode.open', url);
            },
            "path": global.power.require("path"),
            "os": global.power.require("os"),
            "fs": global.power.require("fs"),
            "crypto": global.power.require("crypto"),
        }
    }

    const notyet = () => { console.log("not yet") }
    return {
        "log": console.log,
        "open": notyet,
    }
}

async function dox() {
    const { log, open } = getEnv()
    const fp = filePath()
    log("open ", fp)
    writeFile(fp, noteHeader())
    open(fp)
}

exports.execute = async (power) => {
    // global.power = power
    setEnv(power)
    await dox()
}

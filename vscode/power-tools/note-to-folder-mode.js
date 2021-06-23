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
            "vscodecmd": (cmd) => {
                const vscode = global.power.require("vscode")
                vscode.commands.executeCommand(cmd);
            },
            "currentFilePath": () => {
                return global.power.replaceValues("${activeFile}")
            }
        }
    }

    const notyet = () => { console.log("not yet") }
    return {
        "log": console.log,
        "open": notyet,
    }
}

function isDirMode(filePath) {
    const { path } = getEnv()
    const dir = path.dirname(filePath)
    const fileName = path.basename(filePath)
    const dirName = path.basename(dir)
    return dirName === fileName
}

async function dox() {
    const { log, open, currentFilePath, fs, path, vscodecmd } = getEnv()
    const cf = currentFilePath()
    if (isDirMode(cf)) {
        log("is dir mode ignore")
        return
    }
    const fileName = path.basename(cf)
    log("ff", fileName)
    fs.renameSync(cf, `${cf}-renameing.tmp`)
    fs.mkdirSync(cf, { recursive: true })
    fs.renameSync(`${cf}-renameing.tmp`, `${cf}/${fileName}`)
    vscodecmd("workbench.action.closeActiveEditor")
    open(`${cf}/${fileName}`)

}

exports.execute = async (power) => {
    setEnv(power)
    await dox()
}


function getDate() {
    const date = new Date();
    return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`
}

function noteHeader(pt) {
    const crypto = pt.require("crypto");
    const randomHex = crypto.randomBytes(4).toString('hex');
    log(pt, randomHex)
    const date = new Date();
    return `---
id: '${randomHex}',
time: ${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}T${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}+08:00',
---`
}
// YYY/MM月/第X周/MMDD周N.md
function filePath() {

}

function writeFile() {

}

exports.execute = async (pt) => {
    try {
        const vscode = pt.require('vscode');
        const fs = pt.require("fs")
        const os = pt.require("os")
        const today = getDate()
        const home = os.homedir()
        const file = `${home}/sm/ns/share/note/${today}.md`
        if (!fs.existsSync(file)) {
            fs.writeFileSync(file, noteHeader(pt))
        }
        const url = vscode.Uri.parse('file://' + file);
        vscode.commands.executeCommand('vscode.open', url);
    } catch (e) {
        log(pt, e)
    }
};

function log(pt, msg) {
    const vscode = pt.require('vscode');
    vscode.window.showInformationMessage(msg)
}
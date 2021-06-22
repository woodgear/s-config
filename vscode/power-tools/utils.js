function log(pt, msg) {
    const vscode = pt.require('vscode');
    vscode.window.showInformationMessage(msg)
}
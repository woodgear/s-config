const { log } = require('./utils')
exports.execute = async (pt) => {
    const vscode = args.require('vscode');
    const currentFile = args.replaceValues("${activeFile}")
    log(pt, currentFile)
};

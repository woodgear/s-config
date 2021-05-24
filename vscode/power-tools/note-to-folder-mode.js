exports.execute = async (args) => {
    // args => https://egodigital.github.io/vscode-powertools/api/interfaces/_contracts_.workspacecommandscriptarguments.html

    // s. https://code.visualstudio.com/api/references/vscode-api
    const vscode = args.require('vscode');
    const currentFile = args.replaceValues("${activeFile}")

    vscode.window.showInformationMessage(
        `${currentFile}`
    );
};

module.exports = function (selection) {
    // selection is a string containing:
    // 1. the current text selection
    // 2. the entire contents of the active editor when nothing is selected
    return `JSON.stringify(${selection})`;
};
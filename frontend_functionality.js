

function searchInText(text, searchString, start_index=0){
    var lowerTxt = text.toLowerCase();

    var lowerSearchString = searchString.toLowerCase();
    var index = lowerTxt.indexOf(lowerSearchString, start_index);

    var selectionStart = -1;
    var selectionEnd = -1;
    if (index !== -1) {
        selectionStart = index;
        selectionEnd = index + searchString.length;

        } else {
        // Clear the selection if the search string is not found
        selectionStart = -1;
        selectionEnd = -1;
    }
    return [selectionStart, selectionEnd];
}




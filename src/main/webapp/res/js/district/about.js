var sections = $('h5').get();

for (var i in sections) {
    var header = sections[i];
    var link = document.createElement('a');
    link.href = '#'.concat(header.textContent);
    link.className = 'btn btn-primary';
    link.textContent = header.textContent;
    document.getElementById('directory-btn-group').appendChild(link);
}


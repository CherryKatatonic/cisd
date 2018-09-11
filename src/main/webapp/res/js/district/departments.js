var sections = $('#directory-columns h5').get();

for (var i in sections) {
    var header = sections[i];
    var link = document.createElement('a');
    link.href = '#'.concat(header.textContent);
    link.className = 'btn btn-primary';
    link.textContent = header.textContent;
    document.getElementById('directory-btn-group').appendChild(link);
}

if (window.innerWidth < 768) {
    collapse();
} else {
    restore();
}

$(window).resize(function() {
    if (window.innerWidth < 768) {
        collapse();
    } else {
        restore();
    }
});

function collapse() {
    $('#directory-btn-group').addClass('m-auto pb-2 float-none');
    $('#directory-header').addClass('text-center pt-2 pl-0');
    $('#directory-columns').css('column-count', 1);
}

function restore() {
    $('#directory-btn-group').removeClass('m-auto pb-2 float-none');
    $('#directory-header').removeClass('text-center pt-2 pl-0');
    $('#directory-columns').css('column-count', 3);
}
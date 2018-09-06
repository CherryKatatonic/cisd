var sections = $('h5').get();
var dynamicLinks =
    $('<li class="nav-item active">\n' +
        '    <a class="nav-link" href="/">HOME</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/about">ABOUT US</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/athletics">ATHLETICS</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/departments">DEPARTMENTS</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/community">PARENTS & COMMUNITY</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/staff">STAFF</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/calendar">CALENDAR</a>\n' +
        '</li>');

$('#nav2-links').append(dynamicLinks);

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

if (window.innerWidth < 768) {
    collapse();
} else {
    restore();
}

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
function show(id) {
    let div = document.getElementById('div' + id.toString());
    console.log(id);
    console.log('div' + id.toString());
    if (div.style.display === 'none') {
        div.style.display = 'block';
    } else {
        div.style.display = 'none';
    }
}
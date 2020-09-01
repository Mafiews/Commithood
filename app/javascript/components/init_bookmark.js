const initBookmark = () => {
  const bookMarks = document.querySelectorAll('.interested')

  bookMarks.forEach(bookMark => {
    bookMark.addEventListener("mouseover",(event) => {
      // console.log(event.currentTarget);
      event.currentTarget.querySelector('.infobulle').style.display = "block";

    });
    bookMark.addEventListener("mouseout",(event) => {
      // console.log(event.currentTarget);
      event.currentTarget.querySelector('.infobulle').style.display = "none";

    });
  });

}

export { initBookmark };

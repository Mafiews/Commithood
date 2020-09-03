const initSearchbarIndexHide = () => {
  const button = document.querySelector('.button-menu i');
  const menu = document.querySelector('.search-bar-index');
  const div = document.querySelector('.button-menu')
  if (button) {
    button.addEventListener('click',(event)=>{
      if (button.classList.contains('fa-caret-square-left')) {
        button.classList.remove("fa-caret-square-left");
        button.classList.add("fa-caret-square-right");
        div.classList.add("button-menu-inactive");
        menu.classList.add('inactive');
      } else {
        button.classList.remove("fa-caret-square-right");
        button.classList.add("fa-caret-square-left");
        div.classList.remove("button-menu-inactive");
        menu.classList.remove('inactive');
      };
    });
  }
}

export {initSearchbarIndexHide};

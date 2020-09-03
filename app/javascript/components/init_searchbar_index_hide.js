const initSearchbarIndexHide = () => {
  const button = document.querySelector('#button-menu i');
  const menu = document.querySelector('.search-bar-index');
  console.log(menu);
  button.addEventListener('click',(event)=>{
    if (button.classList.contains('fa-caret-square-left')) {
      button.classList.remove("fa-caret-square-left");
      button.classList.add("fa-caret-square-right");
      menu.classList.add('inactive');
    } else {
      button.classList.remove("fa-caret-square-right");
      button.classList.add("fa-caret-square-left");
      menu.classList.remove('inactive');
    };
  });
}

export {initSearchbarIndexHide};

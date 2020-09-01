const initEventinfo = () => {
  const markers = document.querySelectorAll(".marker");
  if (markers.length > 0) {
    markers.forEach((marker) => {
      marker.addEventListener('click', (event)=>{
        const id = marker.id;
        const eventCard = document.getElementById(`event-${id}`);
        const div = document.getElementById("card-info")
        if (eventCard.classList.contains('active')) {
          eventCard.classList.remove("active");
        } else {
          initCard();
          eventCard.classList.add("active");
          div.classList.add("active");
        }
      })
    });
    const map = document.getElementById('map');
    map.addEventListener('click', (event)=>{
      if (!event.srcElement.classList.contains('marker')) {
        const div = document.getElementById("card-info")
        div.classList.remove("active");
        initCard();
      };
    });
  };
  const initCard = () => {
    const eventCards = document.querySelectorAll(".card-info-window");
      eventCards.forEach((card) =>{
        if (card.classList.contains('active')) {
          card.classList.remove("active");
        };
      });
  }
}

export { initEventinfo };

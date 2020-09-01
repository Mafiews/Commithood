const initEventinfo = () => {
  const markers = document.querySelectorAll(".marker")
  if (markers.length > 0) {
    markers.forEach((marker) => {
      marker.addEventListener('click', (event)=>{
        const id = marker.id;
        // console.log(marker)
        const eventCard = document.getElementById(`event-${id}`);
        const div = document.getElementById("card-info")
        eventCard.classList.add("active")
        div.classList.add("active")
      })
    });
    const map = document.getElementById('map')
    map.addEventListener('click', (event)=>{
      if (!event.srcElement.classList.contains('marker') ) {
        // eventCard.classList.add("active")
        const div = document.getElementById("card-info")
        div.classList.remove("active")
      }

    })
  };
}

export { initEventinfo };

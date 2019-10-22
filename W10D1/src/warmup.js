
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  // console.log(Array.from(htmlElement.children));
  if(Array.from(htmlElement.children).length === 0){
    const p = document.createElement("p");
    p.innerHTML = string;
    htmlElement.appendChild(p);
  } else{
    const p = htmlElement.lastChild;
    p.innerHTML = string;
  }
};

htmlGenerator('Party Time.', partyHeader);
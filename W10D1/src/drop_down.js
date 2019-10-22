
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(){
  const keys = Object.keys(dogs);
  // const ul = document.getElementsByClassName("drop-down-dog-list");
  const ul = document.querySelector(".drop-down-dog-list");
  for(let i = 0; i < keys.length; i++){
    const a = document.createElement("a");
    a.innerHTML = keys[i];
    a.href = dogs[keys[i]];
    const li = document.createElement("li");
    li.classList.add("dog-link");
    li.classList.add("hidden");
    // ul[0].appendChild(li);
    ul.appendChild(li);
    li.appendChild(a);
  }
}

dogLinkCreator();

function handleEnter(){
  const dogLinks = document.getElementsByClassName("dog-link");
  for (let i = 0; i < dogLinks.length; i++){
    dogLinks[i].classList.remove('hidden');
  }
}

function handleLeave(){
  const dogLinks = document.getElementsByClassName("dog-link");
  for (let i = 0; i < dogLinks.length; i++) {
    dogLinks[i].classList.add('hidden');
  }
}

const nav = document.querySelector(".drop-down-dog-nav");
nav.addEventListener('mouseenter', handleEnter);
nav.addEventListener('mouseleave', handleLeave);



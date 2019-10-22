let todos = JSON.parse(localStorage.getItem("todos")) || [];

const ul = document.getElementsByClassName('todos');

const form = document.getElementsByClassName('add-todo-form')[0];

form.addEventListener ('submit', (e) => {
  e.preventDefault();
  addToDo();
});

function checked(key){
  for(let i = 0; i < todos.length; i++){
    if(todos[i].value === key){
      todos[i].done = todos[i].done ? false : true;
      break;
    }
  }
  updateLocalStorage();
}

function addToDo(){
  const entry = document.getElementsByName("add-todo")[0].value;
  const bananas = { 
    value: entry,
    done: false
  };
  todos.push(bananas);
  document.getElementsByName("add-todo")[0].value = "";
  populateList();
  updateLocalStorage();
}

function updateLocalStorage(){
  localStorage.setItem("todos", JSON.stringify(todos));
}

function populateList() {
  const todoList = document.getElementsByClassName("todos")[0];
  todoList.innerHTML = "";
  todos.forEach(elements => {
    const lists = document.createElement("label");
    lists.innerHTML = elements.value;
    const checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.checked = elements.done;
    const li = document.createElement("li");
    li.appendChild(lists);
    li.appendChild(checkbox);
    todoList.appendChild(li);
    li.addEventListener('change', (e) => {
      e.preventDefault();
      checked(e.currentTarget.firstChild.innerHTML);
    });
  });
}
populateList();
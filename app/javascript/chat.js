const updateMessages = (question, message) => {
  const container = document.getElementById('messages');
  if (!container)
    return;
  
    // console.log("We can insert chat bubble");
  container.insertAdjacentHTML('beforeend', question);
  container.insertAdjacentHTML('beforeend', message);
}

const getAnswer = (event) => {
  event.preventDefault();

  const input = document.getElementById("chat-id-1-input");

  fetch(`/messages`, { 
    // headers: { accept: 'application/json' },
    headers: {
      'Content-Type': 'application/json',
      accept: 'application/json'
    },
    method: 'POST',
    body: JSON.stringify({question: input.value})
  })
  .then(response => response.json())
  .then((data) => {
    // console.log("We got some data back");
    // console.log(data);
    updateMessages(data['question'], data['answer']);
  });
}

const bindToForm = () => {
  const id = "chat-id-1-form";
  const form = document.getElementById(id);

  if (form) {
    form.addEventListener('submit', getAnswer);
  }
};

export { bindToForm };

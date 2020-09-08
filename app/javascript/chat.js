function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

const updateMessages = (question, message) => {
  const container = document.getElementById('messages');
  if (!container)
    return;

    // console.log("We can insert chat bubble");
  container.insertAdjacentHTML('beforeend', question);

  setTimeout(() => {
    container.insertAdjacentHTML('beforeend', message);
  }, 2000);
}

const setPath = (input, pathID) => {
  if (!input) {
    return;
  }
  const attrPathID = "data-path-id";
  const attrQuestionID = "data-question-id";
  if (!input.hasAttribute(attrPathID)) {
    input.setAttribute(attrPathID, pathID);
    input.setAttribute(attrQuestionID, 1);
  }
}

const setNextQuestion = (input) => {
  if (!input) {
    return;
  }

  const attrQuestionID = "data-question-id";
  if (input.hasAttribute(attrQuestionID)) {
    const nextID = parseInt(input.dataset["questionId"]) + 1;
    input.setAttribute(attrQuestionID, nextID);
  }
}

const removePath = (input) => {
  if (!input) {
    return;
  }

  input.removeAttribute("data-path-id");
  input.removeAttribute("data-question-id");
}

const getAnswer = (event) => {
  event.preventDefault();
  // console.log(event);

  const textEl = event.target.querySelector("#chat-id-1-input");
  // do nothing when user input nothing
  if (textEl.value === '') return;
  
  // if textEl.dataset["pathID"] is undefined
  if (textEl.dataset["pathId"] === undefined) {
    // then setPath
    setPath(textEl, textEl.value);
  } else {
    setNextQuestion(textEl);
  }
  // else getQuestion
  //    construct query inputs
  const inputs = {
    path: textEl.getAttribute("data-path-id"),
    question: textEl.getAttribute("data-question-id"),
    user_input: textEl.value
  }

  fetch(`/messages`, {
    headers: {
      'Content-Type': 'application/json',
      accept: 'application/json'
    },
    method: 'POST',
    body: JSON.stringify(inputs)
  })
  .then(response => response.json())
  .then((data) => {
    // console.log("We got some data back", data);
    if (!data['end_of_path']) {
      updateMessages(data['question'], data['answer']);
    } else {
      removePath(textEl);
      showPaths();
    }
  });

  textEl.value = "";
}

const bindToForm = () => {
  const id = "chat-id-1-form";
  const form = document.getElementById(id);

  if (form) {
    // console.log('binded');
    form.addEventListener('submit', getAnswer);
  }
};

const showPaths = () => {
  const container = document.getElementById('messages');
  if (!container) {
    return;
  }
  // sleep(2000);

  fetch(`/paths`, {
    headers: {
      accept: 'application/json'
    },
    method: 'GET',
  })
  .then(response => response.json())
  .then((data) => {
    // console.log("We got some data back");
    // console.log(data);
    setTimeout(() => {
      const html = data["paths"];
      container.insertAdjacentHTML('beforeend', html);
    }, 2000);
  });
}

export { bindToForm, showPaths };

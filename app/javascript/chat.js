function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}


const updateMessages = (question, message) => {
  const container = document.getElementById('messages');
  if (!container)
    return;

    // console.log("We can insert chat bubble");
  container.insertAdjacentHTML('beforeend', question);
  container.insertAdjacentHTML('beforeend', message);
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


const getAnswer = (event) => {
  event.preventDefault();
  // console.log(event);

  const textEl = event.target.querySelector("#chat-id-1-input");
  console.log('getting answer');
  
  // if textEl.dataset["pathID"] is undefined
  console.log(textEl.dataset["pathId"]);
  if (textEl.dataset["pathId"] === undefined) {
    // then setPath
    console.log('set path');
    setPath(textEl, textEl.value);
  } else {
    console.log('go to next question');
    setNextQuestion(textEl);
  }
  // else getQuestion
  const attrPathID = "data-path-id";
  const attrQuestionID = "data-question-id";
  // construct query inputs
  const inputs = {
    path: textEl.getAttribute(attrPathID),
    question: textEl.getAttribute(attrQuestionID),
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
    console.log("We got some data back");
    console.log(data);
    updateMessages(data['question'], data['answer']);
  });

  textEl.value = "";
}

const bindToForm = () => {
  const id = "chat-id-1-form";
  const form = document.getElementById(id);

  if (form) {
    console.log('binded');
    form.addEventListener('submit', getAnswer);
  }
};

const showPaths = () => {
  const container = document.getElementById('messages');
  if (!container) {
    return;
  }

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
    sleep(2000);
    const html = data["paths"];
    container.insertAdjacentHTML('beforeend', html);
  });
}

export { bindToForm, showPaths };

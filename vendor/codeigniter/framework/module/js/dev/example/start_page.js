function formatName(user) {
	return user.firstName + ' ' + user.lastName;
}

const user = {
	firstName: 'Daehyun',
	lastName: 'Im'
};

function tick() {
  const element = (
    <div>
      <h1>Hello, world!</h1>
      <h2>{new Date().toLocaleTimeString()}.</h2>
    </div>
  );
  ReactDOM.render(
    element,
    document.getElementById('example')
  );
}

function tick2() {
  const element = (
    <div>
      <h1>Hello, world!</h1>
      <h2>{formatName(user)}.</h2>
    </div>
  );
  ReactDOM.render(
    element,
    document.getElementById('example2')
  );
}

setInterval(tick, 1000);
setInterval(tick2, 1000);

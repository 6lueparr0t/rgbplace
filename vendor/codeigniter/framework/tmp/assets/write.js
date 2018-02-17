function send_write(recv) {
    var form = new FormData(recv);

    var request = new XMLHttpRequest();
    var data = "";

    request.open('post', '/board/request/write.php', true);

    request.onload = function () {
        if (this.status >= 200 && this.status < 400) {
            // Success!
            data = this.response;
            if (data) {
                location.replace("/");
            } else {
                console.log(data);
            }
            console.log(data);
        } else {
        }
    };

    request.onprogress = function () {
    };

    request.onerror = function () {
    };

    request.send(form);
}

function send_modify(recv) {
    var form = new FormData(recv);

    var request = new XMLHttpRequest();
    var data = "";

    request.open('post', '/board/request/modify.php', true);

    request.onload = function () {
        if (this.status >= 200 && this.status < 400) {
            // Success!
            data = this.response;
            if (data) {
                location.replace("/");
            } else {
                console.log(data);
            }
            console.log(data);
        } else {
        }
    };

    request.onprogress = function () {
    };

    request.onerror = function () {
    };

    request.send(form);
}

function send_follow(recv) {
    var form = new FormData(recv);

    var request = new XMLHttpRequest();
    var data = "";

    request.open('post', '/board/request/follow.php', true);

    request.onload = function () {
        if (this.status >= 200 && this.status < 400) {
            // Success!
            data = this.response;
            if (data) {
                //console.log(data);
                location.replace("/");
            } else {
                console.log(data);
            }
            console.log(data);
        } else {
        }
    };

    request.onprogress = function () {
    };

    request.onerror = function () {
    };

    request.send(form);
}

var write = document.querySelector("#write");
var modify = document.querySelector("#modify");
var follow = document.querySelector("#follow");

if (write) write.addEventListener("submit", function () {
    event.preventDefault();
    send_write(write);
});

if (modify) modify.addEventListener("submit", function () {
    event.preventDefault();
    send_modify(modify);
});

if (follow) follow.addEventListener("submit", function () {
    event.preventDefault();
    send_follow(follow);
});
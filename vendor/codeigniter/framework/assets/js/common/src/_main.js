// main.js

import React from 'react'
import ReactDOM from 'react-dom'
import Lside from './lside'
import Rside from './rside'

const Lmenu = Lside;
const Rmenu = Rside;

const Lnode = document.createElement('div')
document.body.appendChild(Lnode)

const Rnode = document.createElement('div')
document.body.appendChild(Rnode)

ReactDOM.render(<Lmenu />, Lnode)
ReactDOM.render(<Rmenu />, Rnode)

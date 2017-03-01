// main.js

import React from 'react'
import ReactDOM from 'react-dom'
import test from './test'

const MyApp = test;

const mountNode = document.createElement('div')
document.body.appendChild(mountNode)

ReactDOM.render(<MyApp />, mountNode)

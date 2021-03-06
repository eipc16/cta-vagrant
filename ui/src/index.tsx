import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'

import './index.css'
import App from './main/app/App'
import * as serviceWorker from './main/app/serviceWorker'
import { store } from './main/app/redux/store'

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
)

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister()

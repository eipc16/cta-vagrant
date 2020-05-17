import React, { useState } from 'react'

import { AuthenticationServiceImpl } from '../../services'
import { RegisterForm } from '../register-form/register-form'
import './register-page.scss'
import { RegisterActionPublisherImpl } from '../../redux/actions/register'
import {PageHeader} from "antd";
import {useHistory} from "react-router-dom";

export const RegisterPage = (props: any) => {
  const [authService] = useState(AuthenticationServiceImpl.createInstance())
  const [registerPublisher] = useState(new RegisterActionPublisherImpl(authService))

  let history = useHistory();
  const onClick = () => {
    history.push('/login')
  }

  return (
      <div>
        <PageHeader
            className="site-page-header"
            onBack={() => onClick()}
            title="Register page"
        />
        <div className="Register">
          <RegisterForm registerPublisher={registerPublisher} {...props} />
        </div>
      </div>
  )
}

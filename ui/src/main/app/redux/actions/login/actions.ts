import {loginConstants} from '../../constants'
import {LoginData, Token} from '../../../models/authorization'
import {Action, Dispatch} from 'redux'
import {AuthenticationService} from '../../../services'
import {
    LogoutAction,
    LoginRequestActionInterface,
    LoginSuccessActionInterface,
    LoginFailureActionInterface
} from './types'
import {AlertPublisher, AlertPublisherImpl} from '../alert'
import {Alert} from '../../../models/infrastructure'

export interface LoginActionPublisher {
    login(loginData: LoginData, errorAlertSupplier?: (message: string) => Alert): (dispatch: Dispatch<Action>) => void;

    logout(): LogoutAction;
}

export class LoginActionPublisherImpl implements LoginActionPublisher {
    authService: AuthenticationService;
    alertPublisher: AlertPublisher;

    constructor(authService: AuthenticationService, alertPublisher?: AlertPublisher) {
        this.authService = authService;
        this.alertPublisher = alertPublisher || AlertPublisherImpl.createInstance();
    }

    login(loginData: LoginData, errorAlertSupplier?: (message: string) => Alert): (dispatch: Dispatch<Action>) => void {
        function request(loginData: LoginData): LoginRequestActionInterface {
            return {
                type: loginConstants.LOGIN_REQUEST,
                userData: loginData
            }
        }

        function success(token: Token): LoginSuccessActionInterface {
            return {
                type: loginConstants.LOGIN_SUCCESS,
                token: token
            }
        }

        function failure(error: string): LoginFailureActionInterface {
            return {
                type: loginConstants.LOGIN_FAILURE,
                error: error
            }
        }

        return (dispatch: Dispatch<Action>): void => {
            dispatch(request(loginData));

            this.authService.login(loginData)
                .then(
                    (token: Token) => {
                        dispatch(success(token))
                    },
                    (errorResponse: string) => {
                        dispatch(failure(errorResponse));
                        if (errorAlertSupplier) {
                            const alert = errorAlertSupplier(errorResponse);
                            this.alertPublisher.pushAlert(alert)(dispatch);
                        }
                    }
                )
        };
    }

    logout(): LogoutAction {
        this.authService.logout()
        return {
            type: loginConstants.LOGOUT
        }
    }
}

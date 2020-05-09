import { loginConstants } from '../constants';
import { AuthenticationServiceImpl } from '../../services';
import {LoginAction, LoginSuccessActionInterface, LogoutAction} from '../actions/login';
import { Token } from '../../models/authorization';

let authService = new AuthenticationServiceImpl();
let localToken = authService.getLocalToken();
const initialState
    = localToken ? { loggedIn: true, token: localToken} : {};

export interface AuthorizationState {
    loggedIn?: boolean;
    loggingIn?: boolean;
    token?: Token;
}

export function authorizationReducer(state: AuthorizationState = initialState, action: LoginAction | LogoutAction ): AuthorizationState {
    switch(action.type) {
        case loginConstants.LOGIN_SUCCESS:
            return {
                loggedIn: true,
                token: (action as LoginSuccessActionInterface).token
            };
        case loginConstants.LOGIN_REQUEST:
            return {
                loggingIn: true,
            };
        case loginConstants.LOGIN_FAILURE:
            return {};
        case loginConstants.LOGOUT:
            return {};
        default:
            return state;
    }
}
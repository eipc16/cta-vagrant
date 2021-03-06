import {registerConstants} from '../../constants'
import {RegistrationData} from '../../../models/authorization'
import {Alert, Resource} from '../../../models/infrastructure'
import {Action, Dispatch} from 'redux'
import {AuthenticationService} from '../../../services'
import {RegisterFailureActionInterface, RegisterRequestActionInterface, RegisterSuccessActionInterface} from './types'
import {AlertPublisher, AlertPublisherImpl} from '../alert'

export interface RegisterActionPublisher {
    register(registrationData: RegistrationData, errorAlertSupplier?: (message: string) => Alert): (dispatch: Dispatch<Action>) => void;
}

export class RegisterActionPublisherImpl implements RegisterActionPublisher {
    authService: AuthenticationService;
    alertPublisher: AlertPublisher;

    constructor(authService: AuthenticationService, alertPublisher?: AlertPublisher) {
        this.authService = authService;
        this.alertPublisher = alertPublisher || AlertPublisherImpl.createInstance();
    }

    register(registrationData: RegistrationData, errorAlertSupplier?: (message: string) => Alert): (dispatch: Dispatch<Action>) => void {
        function request(registrationData: RegistrationData): RegisterRequestActionInterface {
            return {
                type: registerConstants.REGISTER_REQUEST,
                registrationData: registrationData
            }
        }

        function success(resource: Resource): RegisterSuccessActionInterface {
            return {
                type: registerConstants.REGISTER_SUCCESS,
                resource: resource
            }
        }

        function failure(error: string): RegisterFailureActionInterface {
            return {
                type: registerConstants.REGISTER_FAILURE,
                error: error
            }
        }

        return (dispatch: Dispatch<Action>): void => {
            dispatch(request(registrationData));

            this.authService.register(registrationData)
                .then(
                    (resource: Resource) => {
                        dispatch(success(resource));
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
}

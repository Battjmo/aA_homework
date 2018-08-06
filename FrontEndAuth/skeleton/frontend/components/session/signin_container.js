import {connect} from 'react-redux';
import { loginUser } from '../../actions/session';
import Signin from './signin';

const mapDispatchToProps = dispatch => ({
  loginUser: formUser => dispatch(loginUser(formUser)),
});

export default connect(null, mapDispatchToProps)(Signin);

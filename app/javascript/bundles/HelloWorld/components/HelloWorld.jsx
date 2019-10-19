import PropTypes from 'prop-types';
import React from 'react';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */

   //first after initialize
  constructor(props) {
    super(props);
    this.state = { name: this.props.name };
    console.log("constructor()");
  }

  //before render() and after update
  static getDerivedStateFromProps(props, state) {
    //return {favoritecolor: props.favcol };
    console.log("getDerivedStateFromProps()");
  }

  //afret getDerivedStateFromProps() in mounting at 3rd
  render() {
    console.log("render()");
    return (
      <div>
        <h3>
          Hello, {this.state.name}!
        </h3>
        <hr />
        <form >
          <label htmlFor="name">
            Say hello to:
          </label>
          <input
            id="name"
            type="text"
            value={this.state.name}
            onChange={(e) => this.updateName(e.target.value)}
          />
        </form>
      </div>
    );
  }

  //called after render() in mounting
  componentDidMount(){
    console.log("componentDidMount()");
  }

  shouldComponentUpdate(){
    console.log("shouldComponentUpdate()");
    console.log(true);
    return true;
  }

  getSnapshotBeforeUpdate(prevProps, prevState){
    console.log("getSnapshotBeforeUpdate()");
  }

  componentDidUpdate(){
    console.log("componentDidUpdate()");
  }

  updateName = (new_name) => {
    console.log("Hello world component updating name");
    this.setState({ name: new_name });
    console.log("Hello world component updated name");
  };

  componentWillUnmount(){
    console.log("componentWillUnmount()");    
  }
}

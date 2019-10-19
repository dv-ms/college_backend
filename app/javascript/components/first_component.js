import React from 'react'
//import ReactDOM from 'react-dom'
export default class FirstComponent extends React.Component{
    constructor(props, context) {
    super(props, context);
    this.state = { 
       name: props.name,
    };
   console.log(this.props)

 }
 componentDidMount(){
   console.log(this.props)

 }
 render() {
    return (
       <div>
          <h1>Hello: {this.state.name}</h1>
       </div>
    )
 }
}

//export default FirstComponent;
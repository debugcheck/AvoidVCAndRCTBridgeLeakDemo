'use strict';
var React = require('react-native');
var {
  Text,
  View
} = React;


//native modules
var nativeModules = require('react-native').NativeModules;
var {
    TwoViewController
  } = nativeModules;

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'blue'
  },

  text:{
    marginTop: 100,
    marginLeft: 100,
    height: 100
  }
});

class Two extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text} onPress={this.onPress}>Click Me！</Text>
      </View>
    )
  }

  onPress(){
    TwoViewController.foo();
  }
}

React.AppRegistry.registerComponent('Two', () => Two);
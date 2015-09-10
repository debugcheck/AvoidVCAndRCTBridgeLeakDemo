'use strict';

var React = require('react-native');
var {
  Text,
  View,
} = React;


//native modules
var nativeModules = require('react-native').NativeModules;
var {
    VCRouter,
  } = nativeModules;



var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'red'
  },

  text:{
    marginTop: 100,
    marginLeft: 100,
    height: 100
  }
});

class One extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text} onPress={this.onPress}>Click Me.</Text>
      </View>
    );
  }

  onPress(){
    VCRouter.toTwo();
  }

}

React.AppRegistry.registerComponent('One', () => One);
import React from 'react';
import Navbar from './components/sidenav/Navbar'
import Wikipage from  './components/wiki/Wikipage'
import Head from './components/Head'
import Prism from "prismjs";

import './components/styles/navbar.css'
import './components/styles/universal.css'
import './components/styles/prism.css'
import './App.scss'

function App() {
  return (
    <div className="App" data-spy="scroll" data-target="#LanguageList">
        <script src="../src/components/styles/prism.js"></script>
        <Head/>

        <div className="row" >
          <div className="SideNav col-sm-2" style={{padding:0,paddingLeft:15}}>
              <Navbar/>
          </div>

          <div className="WikiPage col-sm-10" style={{padding:0,paddingRight:15, backgroundColor:'#33333b'}}>
              <Wikipage/>
          </div>
        </div>
       
    </div>
  );
}

export default App;

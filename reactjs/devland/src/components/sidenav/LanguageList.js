import React, { Component } from 'react'
import NavbarLanguage from './NavbarLanguage'
import languages from '../data/Languages.json'
import uuidv4 from 'uuid/v4'

class LanguageList extends Component {
    state = {  }
    render() {
        return (
            <div id="LanguageList" >
                {languages.map((lang,index)=>{
                    return(<NavbarLanguage language={lang.language} subcategories={lang.subcategories}  key={uuidv4()}></NavbarLanguage>)
                })}
            </div>
        );
    }
}

export default LanguageList;
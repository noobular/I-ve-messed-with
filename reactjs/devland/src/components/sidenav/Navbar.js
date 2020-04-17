import React from 'react'
import LanguageList from './LanguageList'

export default function Navbar() {
    return (
        <div className="bg-dark" id="sidebar-wrapper">
                <div style={{background:'#52525e'}}>
                    <h1 className="text-white" style={{textAlign:'center',fontFamily:'devland'}}>DevLand</h1>
                    <div className="list-group list-group-flush">
                    
                    <div style={{paddingLeft:5,paddingRight:5,marginBottom:10}}>
                        <input className="form-control" type="text" placeholder="Search..." style={{borderRadius:20}}/>
                    </div>
                </div>
            </div>
           <LanguageList/>
      </div>
    )
}

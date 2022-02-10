import React from 'react'
import LanguageList from './LanguageList'

export default function Navbar() {
    return (
        <div className="bg-dark" id="sidebar-wrapper">
                <div style={{background:'#52525e'}}>
                    <h4 className="text-white" style={{textAlign:'center',fontFamily:'dongle',fontSize:80,fontWeight:'bold',margin:0}}>DevLand</h4>
                    <div className="list-group list-group-flush">
                    
                    <div style={{paddingLeft:5,paddingRight:5,marginBottom:10}}>
                        <input className="form-control" type="text" placeholder="Search..." style={{borderRadius:8}}/>
                    </div>
                </div>
            </div>
           <LanguageList/>
      </div>
    )
}

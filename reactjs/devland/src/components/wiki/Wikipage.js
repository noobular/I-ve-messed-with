import React from 'react'
import Codeblock from './Codeblock'

export default function Wikipage() {
    return (
        <div style={{padding:25}}>
            <ul style={{fontFamily:'Dongle',fontSize:24,fontWeight:'bold'}} className="breadcrumb bg-dark">
                <li className="breadcrumb-item"><a href="#">CSS</a></li>
                <li className="breadcrumb-item"><a href="#">Border</a></li>
                <li className="breadcrumb-item active"><a href="#">border-radius</a></li>
            </ul>

            <h1 className="text-white" style={{fontFamily:'Dongle', fontSize:70}}> Border Radius</h1>
            <h3 style={{marginLeft:25,fontFamily:'Dongle',fontSize:50}} className="text-white">Usage</h3>
           
           
           
           <Codeblock
                template={`  
.Class_Name{
    border-radius:0px;
}                

#ID_Name{
    border-radius:0px;
}
                `}
                language="language-css"
            />

            <h3 style={{marginLeft:25,marginTop:25,fontFamily:'Dongle', fontSize:50}} className="text-white">Example</h3>

           <Codeblock
                template={`   
.btnFlat{
    border-radius:0px;
}

.btnRound{
    border-radius:25px;
}
                `}
                language="language-css"
            />

        <button className="btn bg-light" style={{borderRadius:0}}>Button Flat</button>
        <button className="btn bg-light" style={{borderRadius:25}}>Button Round</button>

        </div>
    )
}

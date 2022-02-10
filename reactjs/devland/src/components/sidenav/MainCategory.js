import React from 'react'
import {Collapse} from 'react-bootstrap'
import uuidv4 from 'uuid/v4'

export default function MainCategory(props) {
    const [open, setOpen] = React.useState(false);
    
    return (<>
        <a href="#"  onClick={() => setOpen(!open)} aria-controls={props.info[0] + '-Collapse'}  style={{fontFamily:'dongle'}} aria-expanded={open} className="list-group-item list-group-item-action NavbarLanguage">{props.info[0]}</a>                                 
        <Collapse in={open}>
            <div id={props.info[0] + '-Collapse'} className="list-group">
                {props.info[1].map((value,index)=>{
                    console.log(value)
                        return (
                            <a href="#" style={{background:"#e3e3e3", fontFamily:'dongle'}}className="list-group-item list-group-item-action SubNavbarLanguage" key={uuidv4()}>{value}</a>                                 
                        )                      
                })}
            </div>
        </Collapse>
    </>
    )
}

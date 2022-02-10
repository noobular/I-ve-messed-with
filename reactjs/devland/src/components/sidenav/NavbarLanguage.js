import React from 'react'
import {Collapse} from 'react-bootstrap'
import MainCategory from './MainCategory'
import uuidv4 from 'uuid/v4'

export default function NavbarLanguage(props) {
    const [open, setOpen] = React.useState(false);
    
    return (<>
    <a href="#" onClick={() => setOpen(!open)} aria-controls={props.language + '-Collapse'} aria-expanded={open} className="list-group-item list-group-item-action bg-dark text-white" style={{fontFamily:'dongle'}}   key={uuidv4()}>{props.language}</a>
    <Collapse in={open}>
        <div id={props.language + '-Collapse'} style={{fontFamily:'dongle'}} className="list-group" key={uuidv4()}>
            {props.subcategories.map((value,index)=>{
                return (
                    <MainCategory info={value}  key={uuidv4()}/>
                )
            })}
        </div>
    </Collapse>
    </>
    )
}

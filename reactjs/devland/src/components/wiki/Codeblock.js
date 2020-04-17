import React from 'react'

export default function Codeblock(props) {
    return (
        <div>
            <pre>
                <code className={props.language}>
                    {props.template}
                </code>
            </pre>
        </div>
    )
}

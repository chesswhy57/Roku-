function init()
    m.menuonfoucs=true
    m.selctedSquare=65
    m.top.setFocus(true)
    m.myLabel = m.top.findNode("myLabel")
    m.myStartButton = m.top.findNode("nicebutton")
    m.myResignButton = m.top.findNode("resignbutton")
    m.myStartButton.setFocus(true)
    m.myLabel.font.size=150
    m.myLabel.color="0x72D7EEFF"

    menuonfoucs=true
    for h = 0 to 7
        for i = 0 to 7
            myRectangle = CreateObject("roSGNode", "Rectangle")
            myLabel = CreateObject("roSGNode", "Label")
            myLabel.text=(h*8+i).toStr()
            myLabel.color="0xFF0000FF"
            myRectangle.width = 80
            myRectangle.height = 80
            myRectangle.focusable = true
            myRectangle.id = "rect"+(h*8+i).toStr()
            if i MOD 2 = h MOD 2 then
                myRectangle.color = "0xFFFFFFFF"
            else
                myRectangle.color = "0x000000FF"
            end if
            myRectangle.translation = [i*80+40, h*80+40]
            myLabel.translation = [i*80+40, h*80+40]
            m.top.appendChild(myRectangle)
            m.top.appendChild(myLabel)
        end for
    end for
    
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press and key="down"  then
        if m.menuonfoucs then
            m.myResignButton.setFocus(true)
        else 
            if m.selctedSquare<56 then
                ogColor()
                m.selctedSquare=m.selctedSquare+8
                changeColor("rect"+m.selctedSquare.toStr())
            end if
        end if
    end if
    if press and key="up" then
        if  m.menuonfoucs then
            m.myStartButton.setFocus(true)
        else 
            if m.selctedSquare > 7 then
                ogColor()
                m.selctedSquare-=8
                changeColor("rect"+m.selctedSquare.toStr())
            end if
        end if
    end if
    if press and key="left" then
        if m.menuonfoucs then
            changeColor("rect47")
            m.selctedSquare=47
        else 
            if not m.selctedSquare MOD 8 = 0 then
                ogColor()
                m.selctedSquare-=1
                changeColor("rect"+m.selctedSquare.toStr())
            end if
        end if
    end if
end function 
sub changeColor(nice as String)
    chessquare=m.top.findNode(nice)
    chessquare.color="0x949494FF"
    m.menuonfoucs=false
end sub

sub ogColor()
    if  m.selctedSquare MOD 2 = 1 then
        m.top.findNode("rect"+m.selctedSquare.toStr()).color = "0xFFFFFFFF"
    else
        m.top.findNode("rect"+m.selctedSquare.toStr()).color = "0x000000FF"
    end if
end sub 
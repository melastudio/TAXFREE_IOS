/*
 * Copyright (C) 2015 - 2017, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit
import Material

class AppFABMenuController: FABMenuController {
    fileprivate let toolbar = Toolbar()
    
    fileprivate var fabButton: FABButton!
    fileprivate var newFABMenuItem: FABMenuItem!
    
    open override func prepare() {
        super.prepare()
        view.backgroundColor = .none
        
        prepareFABButton()
        prepareRemindersFABMenuItem()
        prepareFABMenu()
        
        view.layout(toolbar).bottom().horizontally().height(52)//.bottom(20).right(20)
        toolbar.backgroundColor = .none
        toolbar.rightViews = [fabMenu]
    }
}

extension AppFABMenuController {
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.add, tintColor: .white)
        fabButton.pulseColor = .white
        fabButton.backgroundColor = Color.yellow.base
    }
    
    fileprivate func prepareRemindersFABMenuItem() {
        newFABMenuItem = FABMenuItem()
        newFABMenuItem.title = "Dodaj nowy"
        newFABMenuItem.fabButton.image = Icon.cm.add
        newFABMenuItem.fabButton.tintColor = .white
        newFABMenuItem.fabButton.pulseColor = .white
        newFABMenuItem.fabButton.backgroundColor = Color.blue.base
        newFABMenuItem.fabButton.addTarget(self, action: #selector(handleNewFABMenuItem(button:)), for: .touchUpInside)
    }
    
    fileprivate func prepareFABMenu() {
        fabMenu.fabButton = fabButton
        fabMenu.fabMenuItems = [newFABMenuItem]
        fabMenuBacking = .none

    }
    
    @objc
    fileprivate func handleNewFABMenuItem(button: UIButton) {
        transition(to: DetailViewController())
        fabMenu.close()
        fabMenu.fabButton?.motion(.rotationAngle(0))
    }

    @objc
    open func fabMenuWillOpen(fabMenu: FABMenu) {
        fabMenu.fabButton?.motion(.rotationAngle(45))
        
        print("fabMenuWillOpen")
    }
    
    @objc
    open func fabMenuDidOpen(fabMenu: FABMenu) {
        print("fabMenuDidOpen")
    }
    
    @objc
    open func fabMenuWillClose(fabMenu: FABMenu) {
        fabMenu.fabButton?.motion(.rotationAngle(0))
        
        print("fabMenuWillClose")
    }
    
    @objc
    open func fabMenuDidClose(fabMenu: FABMenu) {
        print("fabMenuDidClose")
    }
    
    @objc
    open func fabMenu(fabMenu: FABMenu, tappedAt point: CGPoint, isOutside: Bool) {
        print("fabMenuTappedAtPointIsOutside", point, isOutside)
        
        guard isOutside else {
            return
        }
        
        // Do something ...
    }
}

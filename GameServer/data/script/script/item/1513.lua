function OnUseItemEvent_1513(uid,thisid)
	    if s_deleteItemByThisID(uid,thisid,1,"6480礼包（4折）") ~= VALUE_OK then
			        return VALUE_FAIL
					    end

						    s_addItem(uid,19004,0,90000,0,"1-1","6480礼包（4折）")
								s_addItem(uid,19003,0,6480,0,"1-1","6480礼包（4折）")
									s_addItem(uid,19105,0,500,0,"1-1","6480礼包（4折）")
										s_addItem(uid,461001,0,3,0,"1-1","6480礼包（4折）")
											s_addItem(uid,461002,0,3,0,"1-1","6480礼包（4折）")
												s_addItem(uid,461003,0,3,0,"1-1","6480礼包（4折）")
													local gold1 = s_getVar(uid,123,30)
														s_setVar(uid,123,30,gold1+64800)
															CheckVipLevel(uid)
																
															    return VALUE_OK
															end


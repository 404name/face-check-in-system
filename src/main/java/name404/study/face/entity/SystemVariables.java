package name404.study.face.entity;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "系统变量")
@Table(name = "system_variables")
@Entity
@Data
public class SystemVariables extends BaseModel {

        @EruptField(
                views = @View(
                        title = "键"
                ),
                edit = @Edit(
                        title = "键",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String myKey;
        @EruptField(
                views = @View(
                        title = "备注名"
                ),
                edit = @Edit(
                        title = "备注名",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String name;
        @EruptField(
                views = @View(
                        title = "值"
                ),
                edit = @Edit(
                        title = "Json修改",
                        type = EditType.CODE_EDITOR, notNull = true,
                        inputType = @InputType
                )
        )
        private String myValue;
}
package name404.study.face.service;

import name404.study.face.entity.Group;

import java.util.List;

/**
 * group组由三个字段组成
 *
 *  id： 标识
 *  groupclass： 组别分类[单位组，课题组，事由]
 *  name: groupclass下面的二级分类名称[比如课题组里面有 李翔老师课题组，李碧涛老师课题组]
 *  message： 二级分类的备注
 */


public interface GroupService {
    /**
     * 增加或者更新组别
     * @param group
     * @return
     */
    Group addAndUpdate(Group group);

    /**
     * 根据组别id删除组别
     * @param group
     */
    void delete(Group group);

    /**
     * 根据id查找组别
     * @param id
     * @return
     */
    Group find(Long id);

    /**
     * 根据一级组别名查询所有符合项
     * @param str
     * @return
     */
    List<Group> findByGroupClass(String str);

    /**
     * 返回所有组别
     * @return
     */
    List<Group> list();

    /**
     * 根据一级组别名查询第index个二级组别
     * @param str
     * @param index
     * @return
     */
    String findNameByKeyAndIndex(String str,Long index);
}

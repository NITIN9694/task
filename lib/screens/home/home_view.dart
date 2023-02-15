import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test/model/menu_model.dart';
import 'package:test/screens/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isShow1.value = !controller.isShow1.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "cat1",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.menuModelDataCart1.length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  controller.isShow1.value
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: controller.isShow1.value,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: controller.menuModelDataCart1.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade50,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .menuModelDataCart1[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "\$ " +
                                                      controller
                                                          .menuModelDataCart1[
                                                              index]
                                                          .price
                                                          .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.orange,
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: controller
                                                        .menuModelDataCart1[
                                                            index]!
                                                        .isAddItem!
                                                    ? Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                controller.onDecrementItem(
                                                                    index,
                                                                    controller
                                                                        .menuModelDataCart1);
                                                              },
                                                              child:
                                                                  const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            14.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .minimize,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Colors
                                                                    .orange,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Text(
                                                                "${controller.menuModelDataCart1[index].itemQuantity.toString()}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller.onIncrementItemCart1(
                                                                    index,
                                                                    controller
                                                                        .menuModelDataCart1);
                                                              },
                                                              child: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : InkWell(
                                                        onTap: () {
                                                          controller
                                                              .menuModelDataCart1[
                                                                  index]
                                                              .isAddItem = true;
                                                          controller
                                                              .menuModelDataCart1
                                                              .refresh();
                                                          print(controller
                                                              .menuModelDataCart1[
                                                                  index]
                                                              .isAddItem
                                                              .toString());
                                                        },
                                                        child: const Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              "Add",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isShow2.value = !controller.isShow2.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "cat2",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.menuModelDataCart2.length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  controller.isShow2.value
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: controller.isShow2.value,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.menuModelDataCart2.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade50,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .menuModelDataCart2[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "\$ ${controller
                                                          .menuModelDataCart2[
                                                              index]
                                                          .price}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Obx(
                                              () => Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.orange,
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: controller
                                                          .menuModelDataCart2[
                                                              index]!
                                                          .isAddItem!
                                                      ? Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onDecrementItem(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart2);
                                                                },
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              14.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .minimize,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .orange,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Text(
                                                                  "${controller.menuModelDataCart2[index].itemQuantity.toString()}",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onIncrementItemCart1(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart2);
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            controller
                                                                .menuModelDataCart2[
                                                                    index]
                                                                .isAddItem = true;
                                                            controller
                                                                .menuModelDataCart2
                                                                .refresh();
                                                            print(controller
                                                                .menuModelDataCart2[
                                                                    index]
                                                                .isAddItem
                                                                .toString());
                                                          },
                                                          child: const Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Add",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isShow3.value = !controller.isShow3.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "cat3",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.menuModelDataCart3.length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  controller.isShow3.value
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: controller.isShow3.value,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.menuModelDataCart3.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade50,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .menuModelDataCart3[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "\$ " +
                                                      controller
                                                          .menuModelDataCart3[
                                                              index]
                                                          .price
                                                          .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Obx(
                                              () => Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.orange,
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: controller
                                                          .menuModelDataCart3[
                                                              index]!
                                                          .isAddItem!
                                                      ? Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onDecrementItem(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart3);
                                                                },
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              14.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .minimize,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .orange,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Text(
                                                                  "${controller.menuModelDataCart3[index].itemQuantity.toString()}",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onIncrementItemCart1(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart3);
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            controller
                                                                .menuModelDataCart3[
                                                                    index]
                                                                .isAddItem = true;
                                                            controller
                                                                .menuModelDataCart3
                                                                .refresh();
                                                            print(controller
                                                                .menuModelDataCart3[
                                                                    index]
                                                                .isAddItem
                                                                .toString());
                                                          },
                                                          child: const Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Add",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isShow4.value = !controller.isShow4.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "cat4",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.menuModelDataCart4.length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  controller.isShow4.value
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: controller.isShow4.value,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.menuModelDataCart1.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade50,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .menuModelDataCart4[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "\$ " +
                                                      controller
                                                          .menuModelDataCart4[
                                                              index]
                                                          .price
                                                          .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Obx(
                                              () => Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.orange,
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: controller
                                                          .menuModelDataCart4[
                                                              index]!
                                                          .isAddItem!
                                                      ? Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onDecrementItem(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart4);
                                                                },
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              14.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .minimize,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .orange,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Text(
                                                                  "${controller.menuModelDataCart4[index].itemQuantity.toString()}",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onIncrementItemCart1(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart4);
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            controller
                                                                .menuModelDataCart4[
                                                                    index]
                                                                .isAddItem = true;
                                                            controller
                                                                .menuModelDataCart4
                                                                .refresh();
                                                            print(controller
                                                                .menuModelDataCart4[
                                                                    index]
                                                                .isAddItem
                                                                .toString());
                                                          },
                                                          child: const Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Add",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isShow5.value = !controller.isShow5.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "cat5",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.menuModelDataCart5.length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  controller.isShow5.value
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: controller.isShow5.value,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.menuModelDataCart5.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade50,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .menuModelDataCart5[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "\$ ${controller
                                                          .menuModelDataCart5[
                                                              index]
                                                          .price}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Obx(
                                              () => Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.orange,
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: controller
                                                          .menuModelDataCart5[
                                                              index]!
                                                          .isAddItem!
                                                      ? Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onDecrementItem(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart5);
                                                                },
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              14.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .minimize,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .orange,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Text(
                                                                  "${controller.menuModelDataCart5[index].itemQuantity.toString()}",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.onIncrementItemCart1(
                                                                      index,
                                                                      controller
                                                                          .menuModelDataCart5);
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            controller
                                                                .menuModelDataCart5[
                                                                    index]
                                                                .isAddItem = true;
                                                            controller
                                                                .menuModelDataCart5
                                                                .refresh();
                                                            print(controller
                                                                .menuModelDataCart5[
                                                                    index]
                                                                .isAddItem
                                                                .toString());
                                                          },
                                                          child: const Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Add",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isShow6.value = !controller.isShow6.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "cat6",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.menuModelDataCart6.length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  controller.isShow6.value
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: controller.isShow6.value,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.menuModelDataCart6.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade50,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .menuModelDataCart6[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "\$ " +
                                                      controller
                                                          .menuModelDataCart6[
                                                              index]
                                                          .price
                                                          .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Obx(
                                                  () => Container(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.orange,
                                                          width: 2.0),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                                  child: controller
                                                      .menuModelDataCart6[
                                                  index]!
                                                      .isAddItem!
                                                      ? Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            controller.onDecrementItem(
                                                                index,
                                                                controller
                                                                    .menuModelDataCart6);
                                                          },
                                                          child:
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .only(
                                                                bottom:
                                                                14.0),
                                                            child: Icon(
                                                              Icons
                                                                  .minimize,
                                                              color: Colors
                                                                  .orange,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(10),
                                                          decoration:
                                                          const BoxDecoration(
                                                            color: Colors
                                                                .orange,
                                                            shape: BoxShape
                                                                .circle,
                                                          ),
                                                          child: Text(
                                                            "${controller.menuModelDataCart6[index].itemQuantity.toString()}",
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller.onIncrementItemCart1(
                                                                index,
                                                                controller
                                                                    .menuModelDataCart6);
                                                          },
                                                          child:
                                                          const Icon(
                                                            Icons.add,
                                                            color: Colors
                                                                .orange,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                      : InkWell(
                                                    onTap: () {
                                                      controller
                                                          .menuModelDataCart6[
                                                      index]
                                                          .isAddItem = true;
                                                      controller
                                                          .menuModelDataCart6
                                                          .refresh();
                                                      print(controller
                                                          .menuModelDataCart6[
                                                      index]
                                                          .isAddItem
                                                          .toString());
                                                    },
                                                    child: const Center(
                                                      child: Padding(
                                                        padding:

                                                        EdgeInsets
                                                            .all(8.0),
                                                        child: Text(
                                                          "Add",
                                                          style:
                                                          TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            color: Colors
                                                                .orange,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            )

                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding:const EdgeInsets.only(top: 20,
                bottom: 20,
                  left: 30,
                  right: 30,
                ),
                margin:const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Place Order",
                      style:
                      TextStyle(
                        fontWeight:FontWeight
                            .w600,
                        color: Colors.white
                            ,
                        fontSize: 15
                      ),
                    ),

                    Text(
                      "\$ 20",
                      style:
                      TextStyle(
                          fontWeight:FontWeight
                              .w600,
                          color: Colors.white
                          ,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

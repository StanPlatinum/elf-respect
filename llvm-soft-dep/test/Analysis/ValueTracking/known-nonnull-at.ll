; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -instsimplify < %s | FileCheck %s

declare void @bar(i8* %a, i8* nonnull %b)

; 'y' must be nonnull.

define i1 @caller1(i8* %x, i8* %y) {
; CHECK-LABEL: @caller1(
; CHECK-NEXT:    call void @bar(i8* %x, i8* %y)
; CHECK-NEXT:    [[NULL_CHECK:%.*]] = icmp eq i8* %y, null
; CHECK-NEXT:    ret i1 [[NULL_CHECK]]
;
  call void @bar(i8* %x, i8* %y)
  %null_check = icmp eq i8* %y, null
  ret i1 %null_check
}

; Don't know anything about 'y'.

define i1 @caller2(i8* %x, i8* %y) {
; CHECK-LABEL: @caller2(
; CHECK-NEXT:    call void @bar(i8* %y, i8* %x)
; CHECK-NEXT:    [[NULL_CHECK:%.*]] = icmp eq i8* %y, null
; CHECK-NEXT:    ret i1 [[NULL_CHECK]]
;
  call void @bar(i8* %y, i8* %x)
  %null_check = icmp eq i8* %y, null
  ret i1 %null_check
}

; 'y' must be nonnull.

define i1 @caller3(i8* %x, i8* %y) {
; CHECK-LABEL: @caller3(
; CHECK-NEXT:    call void @bar(i8* %x, i8* %y)
; CHECK-NEXT:    [[NULL_CHECK:%.*]] = icmp ne i8* %y, null
; CHECK-NEXT:    ret i1 [[NULL_CHECK]]
;
  call void @bar(i8* %x, i8* %y)
  %null_check = icmp ne i8* %y, null
  ret i1 %null_check
}

; Don't know anything about 'y'.

define i1 @caller4(i8* %x, i8* %y) {
; CHECK-LABEL: @caller4(
; CHECK-NEXT:    call void @bar(i8* %y, i8* %x)
; CHECK-NEXT:    [[NULL_CHECK:%.*]] = icmp ne i8* %y, null
; CHECK-NEXT:    ret i1 [[NULL_CHECK]]
;
  call void @bar(i8* %y, i8* %x)
  %null_check = icmp ne i8* %y, null
  ret i1 %null_check
}

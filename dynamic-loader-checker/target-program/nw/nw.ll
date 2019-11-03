; ModuleID = 'nw.c'
source_filename = "nw.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.nw_align.s = private unnamed_addr constant [4 x [4 x i32]] [[4 x i32] [i32 2, i32 -1, i32 -1, i32 -1], [4 x i32] [i32 -1, i32 2, i32 -1, i32 -1], [4 x i32] [i32 -1, i32 -1, i32 2, i32 -1], [4 x i32] [i32 -1, i32 -1, i32 -1, i32 2]], align 16
@.str = private unnamed_addr constant [2 x i8] c"-\00", align 1
@__const.enclave_main.seq_1 = private unnamed_addr constant [9 x i8] c"AGTACGTC\00", align 1
@__const.enclave_main.seq_2 = private unnamed_addr constant [8 x i8] c"ACGTCGT\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"running NW algorithm...\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"exiting...\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @max(i32 %f1, i32 %f2, i32 %f3, i8* %ptr) #0 {
entry:
  %f1.addr = alloca i32, align 4
  %f2.addr = alloca i32, align 4
  %f3.addr = alloca i32, align 4
  %ptr.addr = alloca i8*, align 8
  %max = alloca i32, align 4
  store i32 %f1, i32* %f1.addr, align 4
  store i32 %f2, i32* %f2.addr, align 4
  store i32 %f3, i32* %f3.addr, align 4
  store i8* %ptr, i8** %ptr.addr, align 8
  store i32 0, i32* %max, align 4
  %0 = load i32, i32* %f1.addr, align 4
  %1 = load i32, i32* %f2.addr, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %f1.addr, align 4
  %3 = load i32, i32* %f3.addr, align 4
  %cmp1 = icmp sge i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %f1.addr, align 4
  store i32 %4, i32* %max, align 4
  %5 = load i8*, i8** %ptr.addr, align 8
  store i8 124, i8* %5, align 1
  br label %if.end5

if.else:                                          ; preds = %land.lhs.true, %entry
  %6 = load i32, i32* %f2.addr, align 4
  %7 = load i32, i32* %f3.addr, align 4
  %cmp2 = icmp sgt i32 %6, %7
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  %8 = load i32, i32* %f2.addr, align 4
  store i32 %8, i32* %max, align 4
  %9 = load i8*, i8** %ptr.addr, align 8
  store i8 92, i8* %9, align 1
  br label %if.end

if.else4:                                         ; preds = %if.else
  %10 = load i32, i32* %f3.addr, align 4
  store i32 %10, i32* %max, align 4
  %11 = load i8*, i8** %ptr.addr, align 8
  store i8 45, i8* %11, align 1
  br label %if.end

if.end:                                           ; preds = %if.else4, %if.then3
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %12 = load i32, i32* %max, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone
define dso_local void @dpm_init(i32** %F, i8** %traceback, i32 %L1, i32 %L2, i32 %d) #0 {
entry:
  %F.addr = alloca i32**, align 8
  %traceback.addr = alloca i8**, align 8
  %L1.addr = alloca i32, align 4
  %L2.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32** %F, i32*** %F.addr, align 8
  store i8** %traceback, i8*** %traceback.addr, align 8
  store i32 %L1, i32* %L1.addr, align 4
  store i32 %L2, i32* %L2.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  %0 = load i32**, i32*** %F.addr, align 8
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 0
  %1 = load i32*, i32** %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 0
  store i32 0, i32* %arrayidx1, align 4
  %2 = load i8**, i8*** %traceback.addr, align 8
  %arrayidx2 = getelementptr inbounds i8*, i8** %2, i64 0
  %3 = load i8*, i8** %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 0
  store i8 110, i8* %arrayidx3, align 1
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32 1, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %L1.addr, align 4
  %cmp = icmp sle i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %j, align 4
  %sub = sub nsw i32 0, %6
  %7 = load i32, i32* %d.addr, align 4
  %mul = mul nsw i32 %sub, %7
  %8 = load i32**, i32*** %F.addr, align 8
  %arrayidx4 = getelementptr inbounds i32*, i32** %8, i64 0
  %9 = load i32*, i32** %arrayidx4, align 8
  %10 = load i32, i32* %j, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %idxprom
  store i32 %mul, i32* %arrayidx5, align 4
  %11 = load i8**, i8*** %traceback.addr, align 8
  %arrayidx6 = getelementptr inbounds i8*, i8** %11, i64 0
  %12 = load i8*, i8** %arrayidx6, align 8
  %13 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %13 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 %idxprom7
  store i8 45, i8* %arrayidx8, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %j, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc20, %for.end
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %L2.addr, align 4
  %cmp10 = icmp sle i32 %15, %16
  br i1 %cmp10, label %for.body11, label %for.end22

for.body11:                                       ; preds = %for.cond9
  %17 = load i32, i32* %i, align 4
  %sub12 = sub nsw i32 0, %17
  %18 = load i32, i32* %d.addr, align 4
  %mul13 = mul nsw i32 %sub12, %18
  %19 = load i32**, i32*** %F.addr, align 8
  %20 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %20 to i64
  %arrayidx15 = getelementptr inbounds i32*, i32** %19, i64 %idxprom14
  %21 = load i32*, i32** %arrayidx15, align 8
  %arrayidx16 = getelementptr inbounds i32, i32* %21, i64 0
  store i32 %mul13, i32* %arrayidx16, align 4
  %22 = load i8**, i8*** %traceback.addr, align 8
  %23 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %23 to i64
  %arrayidx18 = getelementptr inbounds i8*, i8** %22, i64 %idxprom17
  %24 = load i8*, i8** %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds i8, i8* %24, i64 0
  store i8 124, i8* %arrayidx19, align 1
  br label %for.inc20

for.inc20:                                        ; preds = %for.body11
  %25 = load i32, i32* %i, align 4
  %inc21 = add nsw i32 %25, 1
  store i32 %inc21, i32* %i, align 4
  br label %for.cond9

for.end22:                                        ; preds = %for.cond9
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i64 @my_strlen(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %s = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  %0 = load i8*, i8** %str.addr, align 8
  store i8* %0, i8** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 8
  %2 = load i8, i8* %1, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i8*, i8** %s, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr, i8** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i8*, i8** %s, align 8
  %5 = load i8*, i8** %str.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %4 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

; Function Attrs: noinline nounwind optnone
define dso_local void @print_matrix(i32** %F, i8* %seq_1, i8* %seq_2) #0 {
entry:
  %F.addr = alloca i32**, align 8
  %seq_1.addr = alloca i8*, align 8
  %seq_2.addr = alloca i8*, align 8
  %L1 = alloca i32, align 4
  %L2 = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %j10 = alloca i32, align 4
  store i32** %F, i32*** %F.addr, align 8
  store i8* %seq_1, i8** %seq_1.addr, align 8
  store i8* %seq_2, i8** %seq_2.addr, align 8
  %0 = load i8*, i8** %seq_1.addr, align 8
  %call = call i64 @my_strlen(i8* %0)
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %L1, align 4
  %1 = load i8*, i8** %seq_2.addr, align 8
  %call1 = call i64 @my_strlen(i8* %1)
  %conv2 = trunc i64 %call1 to i32
  store i32 %conv2, i32* %L2, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %L1, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %j, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc18, %for.end
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %L2, align 4
  %cmp5 = icmp sle i32 %5, %6
  br i1 %cmp5, label %for.body7, label %for.end20

for.body7:                                        ; preds = %for.cond4
  %7 = load i32, i32* %i, align 4
  %cmp8 = icmp sgt i32 %7, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  store i32 0, i32* %j10, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc15, %if.end
  %8 = load i32, i32* %j10, align 4
  %9 = load i32, i32* %L1, align 4
  %cmp12 = icmp sle i32 %8, %9
  br i1 %cmp12, label %for.body14, label %for.end17

for.body14:                                       ; preds = %for.cond11
  br label %for.inc15

for.inc15:                                        ; preds = %for.body14
  %10 = load i32, i32* %j10, align 4
  %inc16 = add nsw i32 %10, 1
  store i32 %inc16, i32* %j10, align 4
  br label %for.cond11

for.end17:                                        ; preds = %for.cond11
  br label %for.inc18

for.inc18:                                        ; preds = %for.end17
  %11 = load i32, i32* %i, align 4
  %inc19 = add nsw i32 %11, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond4

for.end20:                                        ; preds = %for.cond4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @print_traceback(i8** %traceback, i8* %seq_1, i8* %seq_2) #0 {
entry:
  %traceback.addr = alloca i8**, align 8
  %seq_1.addr = alloca i8*, align 8
  %seq_2.addr = alloca i8*, align 8
  %L1 = alloca i32, align 4
  %L2 = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %j10 = alloca i32, align 4
  store i8** %traceback, i8*** %traceback.addr, align 8
  store i8* %seq_1, i8** %seq_1.addr, align 8
  store i8* %seq_2, i8** %seq_2.addr, align 8
  %0 = load i8*, i8** %seq_1.addr, align 8
  %call = call i64 @my_strlen(i8* %0)
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %L1, align 4
  %1 = load i8*, i8** %seq_2.addr, align 8
  %call1 = call i64 @my_strlen(i8* %1)
  %conv2 = trunc i64 %call1 to i32
  store i32 %conv2, i32* %L2, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %L1, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %j, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc18, %for.end
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %L2, align 4
  %cmp5 = icmp sle i32 %5, %6
  br i1 %cmp5, label %for.body7, label %for.end20

for.body7:                                        ; preds = %for.cond4
  %7 = load i32, i32* %i, align 4
  %cmp8 = icmp sgt i32 %7, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  store i32 0, i32* %j10, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc15, %if.end
  %8 = load i32, i32* %j10, align 4
  %9 = load i32, i32* %L1, align 4
  %cmp12 = icmp sle i32 %8, %9
  br i1 %cmp12, label %for.body14, label %for.end17

for.body14:                                       ; preds = %for.cond11
  br label %for.inc15

for.inc15:                                        ; preds = %for.body14
  %10 = load i32, i32* %j10, align 4
  %inc16 = add nsw i32 %10, 1
  store i32 %inc16, i32* %j10, align 4
  br label %for.cond11

for.end17:                                        ; preds = %for.cond11
  br label %for.inc18

for.inc18:                                        ; preds = %for.end17
  %11 = load i32, i32* %i, align 4
  %inc19 = add nsw i32 %11, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond4

for.end20:                                        ; preds = %for.cond4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @strrev(i8* %str) #0 {
entry:
  %retval = alloca i8*, align 8
  %str.addr = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  %0 = load i8*, i8** %str.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %str.addr, align 8
  %2 = load i8, i8* %1, align 1
  %tobool1 = icmp ne i8 %2, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %str.addr, align 8
  store i8* %3, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8*, i8** %str.addr, align 8
  store i8* %4, i8** %p1, align 8
  %5 = load i8*, i8** %str.addr, align 8
  %6 = load i8*, i8** %str.addr, align 8
  %call = call i64 @my_strlen(i8* %6)
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %call
  %add.ptr2 = getelementptr inbounds i8, i8* %add.ptr, i64 -1
  store i8* %add.ptr2, i8** %p2, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i8*, i8** %p2, align 8
  %8 = load i8*, i8** %p1, align 8
  %cmp = icmp ugt i8* %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %p2, align 8
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %11 = load i8*, i8** %p1, align 8
  %12 = load i8, i8* %11, align 1
  %conv3 = sext i8 %12 to i32
  %xor = xor i32 %conv3, %conv
  %conv4 = trunc i32 %xor to i8
  store i8 %conv4, i8* %11, align 1
  %13 = load i8*, i8** %p1, align 8
  %14 = load i8, i8* %13, align 1
  %conv5 = sext i8 %14 to i32
  %15 = load i8*, i8** %p2, align 8
  %16 = load i8, i8* %15, align 1
  %conv6 = sext i8 %16 to i32
  %xor7 = xor i32 %conv6, %conv5
  %conv8 = trunc i32 %xor7 to i8
  store i8 %conv8, i8* %15, align 1
  %17 = load i8*, i8** %p2, align 8
  %18 = load i8, i8* %17, align 1
  %conv9 = sext i8 %18 to i32
  %19 = load i8*, i8** %p1, align 8
  %20 = load i8, i8* %19, align 1
  %conv10 = sext i8 %20 to i32
  %xor11 = xor i32 %conv10, %conv9
  %conv12 = trunc i32 %xor11 to i8
  store i8 %conv12, i8* %19, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i8*, i8** %p1, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr, i8** %p1, align 8
  %22 = load i8*, i8** %p2, align 8
  %incdec.ptr13 = getelementptr inbounds i8, i8* %22, i32 -1
  store i8* %incdec.ptr13, i8** %p2, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %23 = load i8*, i8** %str.addr, align 8
  store i8* %23, i8** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  %24 = load i8*, i8** %retval, align 8
  ret i8* %24
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @strncat(i8* %dst, i8* %src, i64 %n) #0 {
entry:
  %dst.addr = alloca i8*, align 8
  %src.addr = alloca i8*, align 8
  %n.addr = alloca i64, align 8
  %d = alloca i8*, align 8
  %s = alloca i8*, align 8
  store i8* %dst, i8** %dst.addr, align 8
  store i8* %src, i8** %src.addr, align 8
  store i64 %n, i64* %n.addr, align 8
  %0 = load i64, i64* %n.addr, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end11

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %dst.addr, align 8
  store i8* %1, i8** %d, align 8
  %2 = load i8*, i8** %src.addr, align 8
  store i8* %2, i8** %s, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %3 = load i8*, i8** %d, align 8
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp ne i32 %conv, 0
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %d, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1
  store i8* %incdec.ptr, i8** %d, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %do.body

do.body:                                          ; preds = %do.cond, %while.end
  %6 = load i8*, i8** %s, align 8
  %incdec.ptr3 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr3, i8** %s, align 8
  %7 = load i8, i8* %6, align 1
  %8 = load i8*, i8** %d, align 8
  store i8 %7, i8* %8, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv4, 0
  br i1 %cmp5, label %if.then7, label %if.end

if.then7:                                         ; preds = %do.body
  br label %do.end

if.end:                                           ; preds = %do.body
  %9 = load i8*, i8** %d, align 8
  %incdec.ptr8 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr8, i8** %d, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %10 = load i64, i64* %n.addr, align 8
  %dec = add i64 %10, -1
  store i64 %dec, i64* %n.addr, align 8
  %cmp9 = icmp ne i64 %dec, 0
  br i1 %cmp9, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.then7
  %11 = load i8*, i8** %d, align 8
  store i8 0, i8* %11, align 1
  br label %if.end11

if.end11:                                         ; preds = %do.end, %entry
  %12 = load i8*, i8** %dst.addr, align 8
  ret i8* %12
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @nw_align(i32** %F, i8** %traceback, i8* %seq_1, i8* %seq_2, i8* %seq_1_al, i8* %seq_2_al, i32 %d) #0 {
entry:
  %F.addr = alloca i32**, align 8
  %traceback.addr = alloca i8**, align 8
  %seq_1.addr = alloca i8*, align 8
  %seq_2.addr = alloca i8*, align 8
  %seq_1_al.addr = alloca i8*, align 8
  %seq_2_al.addr = alloca i8*, align 8
  %d.addr = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %fU = alloca i32, align 4
  %fD = alloca i32, align 4
  %fL = alloca i32, align 4
  %ptr = alloca i8, align 1
  %nuc = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %s = alloca [4 x [4 x i32]], align 16
  %L1 = alloca i32, align 4
  %L2 = alloca i32, align 4
  %attach = alloca [2 x i8], align 1
  %tmp1 = alloca i8*, align 8
  %tmp2 = alloca i8*, align 8
  store i32** %F, i32*** %F.addr, align 8
  store i8** %traceback, i8*** %traceback.addr, align 8
  store i8* %seq_1, i8** %seq_1.addr, align 8
  store i8* %seq_2, i8** %seq_2.addr, align 8
  store i8* %seq_1_al, i8** %seq_1_al.addr, align 8
  store i8* %seq_2_al, i8** %seq_2_al.addr, align 8
  store i32 %d, i32* %d.addr, align 4
  store i32 0, i32* %k, align 4
  store i32 0, i32* %x, align 4
  store i32 0, i32* %y, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32 2, i32* %a, align 4
  store i32 -1, i32* %b, align 4
  %0 = bitcast [4 x [4 x i32]]* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x [4 x i32]]* @__const.nw_align.s to i8*), i64 64, i1 false)
  %1 = load i8*, i8** %seq_1.addr, align 8
  %call = call i64 @my_strlen(i8* %1)
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %L1, align 4
  %2 = load i8*, i8** %seq_2.addr, align 8
  %call1 = call i64 @my_strlen(i8* %2)
  %conv2 = trunc i64 %call1 to i32
  store i32 %conv2, i32* %L2, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc52, %entry
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %L2, align 4
  %cmp = icmp sle i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end54

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4
  %6 = load i32, i32* %L1, align 4
  %cmp5 = icmp sle i32 %5, %6
  br i1 %cmp5, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond4
  %7 = load i8*, i8** %seq_1.addr, align 8
  %8 = load i32, i32* %j, align 4
  %sub = sub nsw i32 %8, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom
  %9 = load i8, i8* %arrayidx, align 1
  store i8 %9, i8* %nuc, align 1
  %10 = load i8, i8* %nuc, align 1
  %conv8 = sext i8 %10 to i32
  switch i32 %conv8, label %sw.epilog [
    i32 65, label %sw.bb
    i32 67, label %sw.bb9
    i32 71, label %sw.bb10
    i32 84, label %sw.bb11
  ]

sw.bb:                                            ; preds = %for.body7
  store i32 0, i32* %x, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %for.body7
  store i32 1, i32* %x, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %for.body7
  store i32 2, i32* %x, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %for.body7
  store i32 3, i32* %x, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb11, %for.body7, %sw.bb10, %sw.bb9, %sw.bb
  %11 = load i8*, i8** %seq_2.addr, align 8
  %12 = load i32, i32* %i, align 4
  %sub12 = sub nsw i32 %12, 1
  %idxprom13 = sext i32 %sub12 to i64
  %arrayidx14 = getelementptr inbounds i8, i8* %11, i64 %idxprom13
  %13 = load i8, i8* %arrayidx14, align 1
  store i8 %13, i8* %nuc, align 1
  %14 = load i8, i8* %nuc, align 1
  %conv15 = sext i8 %14 to i32
  switch i32 %conv15, label %sw.epilog20 [
    i32 65, label %sw.bb16
    i32 67, label %sw.bb17
    i32 71, label %sw.bb18
    i32 84, label %sw.bb19
  ]

sw.bb16:                                          ; preds = %sw.epilog
  store i32 0, i32* %y, align 4
  br label %sw.epilog20

sw.bb17:                                          ; preds = %sw.epilog
  store i32 1, i32* %y, align 4
  br label %sw.epilog20

sw.bb18:                                          ; preds = %sw.epilog
  store i32 2, i32* %y, align 4
  br label %sw.epilog20

sw.bb19:                                          ; preds = %sw.epilog
  store i32 3, i32* %y, align 4
  br label %sw.epilog20

sw.epilog20:                                      ; preds = %sw.bb19, %sw.epilog, %sw.bb18, %sw.bb17, %sw.bb16
  %15 = load i32**, i32*** %F.addr, align 8
  %16 = load i32, i32* %i, align 4
  %sub21 = sub nsw i32 %16, 1
  %idxprom22 = sext i32 %sub21 to i64
  %arrayidx23 = getelementptr inbounds i32*, i32** %15, i64 %idxprom22
  %17 = load i32*, i32** %arrayidx23, align 8
  %18 = load i32, i32* %j, align 4
  %idxprom24 = sext i32 %18 to i64
  %arrayidx25 = getelementptr inbounds i32, i32* %17, i64 %idxprom24
  %19 = load i32, i32* %arrayidx25, align 4
  %20 = load i32, i32* %d.addr, align 4
  %sub26 = sub nsw i32 %19, %20
  store i32 %sub26, i32* %fU, align 4
  %21 = load i32**, i32*** %F.addr, align 8
  %22 = load i32, i32* %i, align 4
  %sub27 = sub nsw i32 %22, 1
  %idxprom28 = sext i32 %sub27 to i64
  %arrayidx29 = getelementptr inbounds i32*, i32** %21, i64 %idxprom28
  %23 = load i32*, i32** %arrayidx29, align 8
  %24 = load i32, i32* %j, align 4
  %sub30 = sub nsw i32 %24, 1
  %idxprom31 = sext i32 %sub30 to i64
  %arrayidx32 = getelementptr inbounds i32, i32* %23, i64 %idxprom31
  %25 = load i32, i32* %arrayidx32, align 4
  %26 = load i32, i32* %x, align 4
  %idxprom33 = sext i32 %26 to i64
  %arrayidx34 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %s, i64 0, i64 %idxprom33
  %27 = load i32, i32* %y, align 4
  %idxprom35 = sext i32 %27 to i64
  %arrayidx36 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx34, i64 0, i64 %idxprom35
  %28 = load i32, i32* %arrayidx36, align 4
  %add = add nsw i32 %25, %28
  store i32 %add, i32* %fD, align 4
  %29 = load i32**, i32*** %F.addr, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom37 = sext i32 %30 to i64
  %arrayidx38 = getelementptr inbounds i32*, i32** %29, i64 %idxprom37
  %31 = load i32*, i32** %arrayidx38, align 8
  %32 = load i32, i32* %j, align 4
  %sub39 = sub nsw i32 %32, 1
  %idxprom40 = sext i32 %sub39 to i64
  %arrayidx41 = getelementptr inbounds i32, i32* %31, i64 %idxprom40
  %33 = load i32, i32* %arrayidx41, align 4
  %34 = load i32, i32* %d.addr, align 4
  %sub42 = sub nsw i32 %33, %34
  store i32 %sub42, i32* %fL, align 4
  %35 = load i32, i32* %fU, align 4
  %36 = load i32, i32* %fD, align 4
  %37 = load i32, i32* %fL, align 4
  %call43 = call i32 @max(i32 %35, i32 %36, i32 %37, i8* %ptr)
  %38 = load i32**, i32*** %F.addr, align 8
  %39 = load i32, i32* %i, align 4
  %idxprom44 = sext i32 %39 to i64
  %arrayidx45 = getelementptr inbounds i32*, i32** %38, i64 %idxprom44
  %40 = load i32*, i32** %arrayidx45, align 8
  %41 = load i32, i32* %j, align 4
  %idxprom46 = sext i32 %41 to i64
  %arrayidx47 = getelementptr inbounds i32, i32* %40, i64 %idxprom46
  store i32 %call43, i32* %arrayidx47, align 4
  %42 = load i8, i8* %ptr, align 1
  %43 = load i8**, i8*** %traceback.addr, align 8
  %44 = load i32, i32* %i, align 4
  %idxprom48 = sext i32 %44 to i64
  %arrayidx49 = getelementptr inbounds i8*, i8** %43, i64 %idxprom48
  %45 = load i8*, i8** %arrayidx49, align 8
  %46 = load i32, i32* %j, align 4
  %idxprom50 = sext i32 %46 to i64
  %arrayidx51 = getelementptr inbounds i8, i8* %45, i64 %idxprom50
  store i8 %42, i8* %arrayidx51, align 1
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog20
  %47 = load i32, i32* %j, align 4
  %inc = add nsw i32 %47, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc52

for.inc52:                                        ; preds = %for.end
  %48 = load i32, i32* %i, align 4
  %inc53 = add nsw i32 %48, 1
  store i32 %inc53, i32* %i, align 4
  br label %for.cond

for.end54:                                        ; preds = %for.cond
  %49 = load i32, i32* %i, align 4
  %dec = add nsw i32 %49, -1
  store i32 %dec, i32* %i, align 4
  %50 = load i32, i32* %j, align 4
  %dec55 = add nsw i32 %50, -1
  store i32 %dec55, i32* %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog101, %for.end54
  %51 = load i32, i32* %i, align 4
  %cmp56 = icmp sgt i32 %51, 0
  br i1 %cmp56, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %52 = load i32, i32* %j, align 4
  %cmp58 = icmp sgt i32 %52, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %53 = phi i1 [ true, %while.cond ], [ %cmp58, %lor.rhs ]
  br i1 %53, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %54 = load i8**, i8*** %traceback.addr, align 8
  %55 = load i32, i32* %i, align 4
  %idxprom60 = sext i32 %55 to i64
  %arrayidx61 = getelementptr inbounds i8*, i8** %54, i64 %idxprom60
  %56 = load i8*, i8** %arrayidx61, align 8
  %57 = load i32, i32* %j, align 4
  %idxprom62 = sext i32 %57 to i64
  %arrayidx63 = getelementptr inbounds i8, i8* %56, i64 %idxprom62
  %58 = load i8, i8* %arrayidx63, align 1
  %conv64 = sext i8 %58 to i32
  switch i32 %conv64, label %sw.epilog101 [
    i32 124, label %sw.bb65
    i32 92, label %sw.bb74
    i32 45, label %sw.bb91
  ]

sw.bb65:                                          ; preds = %while.body
  %59 = load i8*, i8** %seq_1_al.addr, align 8
  %call66 = call i8* @strncat(i8* %59, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i64 1)
  %60 = load i8*, i8** %seq_2.addr, align 8
  %61 = load i32, i32* %i, align 4
  %sub67 = sub nsw i32 %61, 1
  %idxprom68 = sext i32 %sub67 to i64
  %arrayidx69 = getelementptr inbounds i8, i8* %60, i64 %idxprom68
  %62 = load i8, i8* %arrayidx69, align 1
  %arrayidx70 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  store i8 %62, i8* %arrayidx70, align 1
  %arrayidx71 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 1
  store i8 0, i8* %arrayidx71, align 1
  %63 = load i8*, i8** %seq_2_al.addr, align 8
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  %call72 = call i8* @strncat(i8* %63, i8* %arraydecay, i64 1)
  %64 = load i32, i32* %i, align 4
  %dec73 = add nsw i32 %64, -1
  store i32 %dec73, i32* %i, align 4
  br label %sw.epilog101

sw.bb74:                                          ; preds = %while.body
  %65 = load i8*, i8** %seq_1.addr, align 8
  %66 = load i32, i32* %j, align 4
  %sub75 = sub nsw i32 %66, 1
  %idxprom76 = sext i32 %sub75 to i64
  %arrayidx77 = getelementptr inbounds i8, i8* %65, i64 %idxprom76
  %67 = load i8, i8* %arrayidx77, align 1
  %arrayidx78 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  store i8 %67, i8* %arrayidx78, align 1
  %arrayidx79 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 1
  store i8 0, i8* %arrayidx79, align 1
  %68 = load i8*, i8** %seq_1_al.addr, align 8
  %arraydecay80 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  %call81 = call i8* @strncat(i8* %68, i8* %arraydecay80, i64 1)
  %69 = load i8*, i8** %seq_2.addr, align 8
  %70 = load i32, i32* %i, align 4
  %sub82 = sub nsw i32 %70, 1
  %idxprom83 = sext i32 %sub82 to i64
  %arrayidx84 = getelementptr inbounds i8, i8* %69, i64 %idxprom83
  %71 = load i8, i8* %arrayidx84, align 1
  %arrayidx85 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  store i8 %71, i8* %arrayidx85, align 1
  %arrayidx86 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 1
  store i8 0, i8* %arrayidx86, align 1
  %72 = load i8*, i8** %seq_2_al.addr, align 8
  %arraydecay87 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  %call88 = call i8* @strncat(i8* %72, i8* %arraydecay87, i64 1)
  %73 = load i32, i32* %i, align 4
  %dec89 = add nsw i32 %73, -1
  store i32 %dec89, i32* %i, align 4
  %74 = load i32, i32* %j, align 4
  %dec90 = add nsw i32 %74, -1
  store i32 %dec90, i32* %j, align 4
  br label %sw.epilog101

sw.bb91:                                          ; preds = %while.body
  %75 = load i8*, i8** %seq_1.addr, align 8
  %76 = load i32, i32* %j, align 4
  %sub92 = sub nsw i32 %76, 1
  %idxprom93 = sext i32 %sub92 to i64
  %arrayidx94 = getelementptr inbounds i8, i8* %75, i64 %idxprom93
  %77 = load i8, i8* %arrayidx94, align 1
  %arrayidx95 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  store i8 %77, i8* %arrayidx95, align 1
  %arrayidx96 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 1
  store i8 0, i8* %arrayidx96, align 1
  %78 = load i8*, i8** %seq_1_al.addr, align 8
  %arraydecay97 = getelementptr inbounds [2 x i8], [2 x i8]* %attach, i64 0, i64 0
  %call98 = call i8* @strncat(i8* %78, i8* %arraydecay97, i64 1)
  %79 = load i8*, i8** %seq_2_al.addr, align 8
  %call99 = call i8* @strncat(i8* %79, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i64 1)
  %80 = load i32, i32* %j, align 4
  %dec100 = add nsw i32 %80, -1
  store i32 %dec100, i32* %j, align 4
  br label %sw.epilog101

sw.epilog101:                                     ; preds = %sw.bb91, %while.body, %sw.bb74, %sw.bb65
  %81 = load i32, i32* %k, align 4
  %inc102 = add nsw i32 %81, 1
  store i32 %inc102, i32* %k, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %82 = load i8*, i8** %seq_1_al.addr, align 8
  %call103 = call i8* @strrev(i8* %82)
  store i8* %call103, i8** %tmp1, align 8
  %83 = load i8*, i8** %seq_2_al.addr, align 8
  %call104 = call i8* @strrev(i8* %83)
  store i8* %call104, i8** %tmp2, align 8
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @Ecall_nw(i8* %seq_1, i8* %seq_2, i8* %seq_1_al, i8* %seq_2_al) #0 {
entry:
  %seq_1.addr = alloca i8*, align 8
  %seq_2.addr = alloca i8*, align 8
  %seq_1_al.addr = alloca i8*, align 8
  %seq_2_al.addr = alloca i8*, align 8
  %d = alloca i32, align 4
  %L1 = alloca i32, align 4
  %L2 = alloca i32, align 4
  %F = alloca i32**, align 8
  %i = alloca i32, align 4
  %traceback = alloca i8**, align 8
  %i13 = alloca i32, align 4
  %rv = alloca i32, align 4
  store i8* %seq_1, i8** %seq_1.addr, align 8
  store i8* %seq_2, i8** %seq_2.addr, align 8
  store i8* %seq_1_al, i8** %seq_1_al.addr, align 8
  store i8* %seq_2_al, i8** %seq_2_al.addr, align 8
  store i32 2, i32* %d, align 4
  %0 = load i8*, i8** %seq_1.addr, align 8
  %call = call i64 @my_strlen(i8* %0)
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %L1, align 4
  %1 = load i8*, i8** %seq_2.addr, align 8
  %call1 = call i64 @my_strlen(i8* %1)
  %conv2 = trunc i64 %call1 to i32
  store i32 %conv2, i32* %L2, align 4
  %2 = load i32, i32* %L2, align 4
  %add = add nsw i32 %2, 1
  %conv3 = sext i32 %add to i64
  %mul = mul i64 %conv3, 8
  %call4 = call noalias i8* @malloc(i64 %mul) #5
  %3 = bitcast i8* %call4 to i32**
  store i32** %3, i32*** %F, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %L2, align 4
  %cmp = icmp sle i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %L1, align 4
  %conv6 = sext i32 %6 to i64
  %mul7 = mul i64 %conv6, 4
  %call8 = call noalias i8* @malloc(i64 %mul7) #5
  %7 = bitcast i8* %call8 to i32*
  %8 = load i32**, i32*** %F, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds i32*, i32** %8, i64 %idxprom
  store i32* %7, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %L2, align 4
  %add9 = add nsw i32 %11, 1
  %conv10 = sext i32 %add9 to i64
  %mul11 = mul i64 %conv10, 8
  %call12 = call noalias i8* @malloc(i64 %mul11) #5
  %12 = bitcast i8* %call12 to i8**
  store i8** %12, i8*** %traceback, align 8
  store i32 0, i32* %i13, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc23, %for.end
  %13 = load i32, i32* %i13, align 4
  %14 = load i32, i32* %L2, align 4
  %cmp15 = icmp sle i32 %13, %14
  br i1 %cmp15, label %for.body17, label %for.end25

for.body17:                                       ; preds = %for.cond14
  %15 = load i32, i32* %L1, align 4
  %conv18 = sext i32 %15 to i64
  %mul19 = mul i64 %conv18, 1
  %call20 = call noalias i8* @malloc(i64 %mul19) #5
  %16 = load i8**, i8*** %traceback, align 8
  %17 = load i32, i32* %i13, align 4
  %idxprom21 = sext i32 %17 to i64
  %arrayidx22 = getelementptr inbounds i8*, i8** %16, i64 %idxprom21
  store i8* %call20, i8** %arrayidx22, align 8
  br label %for.inc23

for.inc23:                                        ; preds = %for.body17
  %18 = load i32, i32* %i13, align 4
  %inc24 = add nsw i32 %18, 1
  store i32 %inc24, i32* %i13, align 4
  br label %for.cond14

for.end25:                                        ; preds = %for.cond14
  %19 = load i32**, i32*** %F, align 8
  %20 = load i8**, i8*** %traceback, align 8
  %21 = load i32, i32* %L1, align 4
  %22 = load i32, i32* %L2, align 4
  %23 = load i32, i32* %d, align 4
  call void @dpm_init(i32** %19, i8** %20, i32 %21, i32 %22, i32 %23)
  %24 = load i8*, i8** %seq_1_al.addr, align 8
  %arrayidx26 = getelementptr inbounds i8, i8* %24, i64 0
  store i8 0, i8* %arrayidx26, align 1
  %25 = load i8*, i8** %seq_2_al.addr, align 8
  %arrayidx27 = getelementptr inbounds i8, i8* %25, i64 0
  store i8 0, i8* %arrayidx27, align 1
  %26 = load i32**, i32*** %F, align 8
  %27 = load i8**, i8*** %traceback, align 8
  %28 = load i8*, i8** %seq_1.addr, align 8
  %29 = load i8*, i8** %seq_2.addr, align 8
  %30 = load i8*, i8** %seq_1_al.addr, align 8
  %31 = load i8*, i8** %seq_2_al.addr, align 8
  %32 = load i32, i32* %d, align 4
  %call28 = call i32 @nw_align(i32** %26, i8** %27, i8* %28, i8* %29, i8* %30, i8* %31, i32 %32)
  store i32 %call28, i32* %rv, align 4
  %33 = load i32, i32* %rv, align 4
  %cmp29 = icmp eq i32 %33, 0
  br i1 %cmp29, label %if.then, label %if.end

if.then:                                          ; preds = %for.end25
  %34 = load i32**, i32*** %F, align 8
  %35 = load i8*, i8** %seq_1.addr, align 8
  %36 = load i8*, i8** %seq_2.addr, align 8
  call void @print_matrix(i32** %34, i8* %35, i8* %36)
  %37 = load i8**, i8*** %traceback, align 8
  %38 = load i8*, i8** %seq_1.addr, align 8
  %39 = load i8*, i8** %seq_2.addr, align 8
  call void @print_traceback(i8** %37, i8* %38, i8* %39)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end25
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @enclave_main() #0 {
entry:
  %seq_1 = alloca [9 x i8], align 1
  %seq_2 = alloca [8 x i8], align 1
  %seq_1_al = alloca [50 x i8], align 16
  %seq_2_al = alloca [50 x i8], align 16
  %0 = bitcast [9 x i8]* %seq_1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([9 x i8], [9 x i8]* @__const.enclave_main.seq_1, i32 0, i32 0), i64 9, i1 false)
  %1 = bitcast [8 x i8]* %seq_2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([8 x i8], [8 x i8]* @__const.enclave_main.seq_2, i32 0, i32 0), i64 8, i1 false)
  %call = call i32 (i8*, ...) bitcast (i32 (...)* @puts to i32 (i8*, ...)*)(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [9 x i8], [9 x i8]* %seq_1, i64 0, i64 0
  %arraydecay1 = getelementptr inbounds [8 x i8], [8 x i8]* %seq_2, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %seq_1_al, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %seq_2_al, i64 0, i64 0
  call void @Ecall_nw(i8* %arraydecay, i8* %arraydecay1, i8* %arraydecay2, i8* %arraydecay3)
  %call4 = call i32 (i8*, ...) bitcast (i32 (...)* @puts to i32 (i8*, ...)*)(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0))
  call void @exit(i32 0) #6
  unreachable
}

declare dso_local i32 @puts(...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 3a49d86ed12106d3767eefb5ff6d90f98867f42f)"}

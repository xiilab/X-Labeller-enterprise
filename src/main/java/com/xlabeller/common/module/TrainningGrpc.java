package com.xlabeller.common.module;

import static io.grpc.MethodDescriptor.generateFullMethodName;
import static io.grpc.stub.ClientCalls.asyncUnaryCall;
import static io.grpc.stub.ClientCalls.blockingUnaryCall;
import static io.grpc.stub.ClientCalls.futureUnaryCall;
import static io.grpc.stub.ServerCalls.asyncUnaryCall;
import static io.grpc.stub.ServerCalls.asyncUnimplementedUnaryCall;

/**
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.16.1)",
    comments = "Source: xlabeller/xlabeller.proto")
public final class TrainningGrpc {

  private TrainningGrpc() {}

  public static final String SERVICE_NAME = "xlabeller.Trainning";

  // Static method descriptors that strictly reflect the proto.
  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.TrainRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunTrainningMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "RunTrainning",
      requestType = com.xlabeller.common.module.TrainGRPC.TrainRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.TrainRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunTrainningMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.TrainRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunTrainningMethod;
    if ((getRunTrainningMethod = TrainningGrpc.getRunTrainningMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getRunTrainningMethod = TrainningGrpc.getRunTrainningMethod) == null) {
          TrainningGrpc.getRunTrainningMethod = getRunTrainningMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.TrainRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "RunTrainning"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.TrainRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("RunTrainning"))
                  .build();
          }
        }
     }
     return getRunTrainningMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.InferenceRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunInferenceMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "RunInference",
      requestType = com.xlabeller.common.module.TrainGRPC.InferenceRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.InferenceRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunInferenceMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.InferenceRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunInferenceMethod;
    if ((getRunInferenceMethod = TrainningGrpc.getRunInferenceMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getRunInferenceMethod = TrainningGrpc.getRunInferenceMethod) == null) {
          TrainningGrpc.getRunInferenceMethod = getRunInferenceMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.InferenceRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "RunInference"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.InferenceRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("RunInference"))
                  .build();
          }
        }
     }
     return getRunInferenceMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest,
      com.xlabeller.common.module.TrainGRPC.ControllerResponse> getKillMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "Kill",
      requestType = com.xlabeller.common.module.TrainGRPC.ControllerRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ControllerResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest,
      com.xlabeller.common.module.TrainGRPC.ControllerResponse> getKillMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest, com.xlabeller.common.module.TrainGRPC.ControllerResponse> getKillMethod;
    if ((getKillMethod = TrainningGrpc.getKillMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getKillMethod = TrainningGrpc.getKillMethod) == null) {
          TrainningGrpc.getKillMethod = getKillMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.ControllerRequest, com.xlabeller.common.module.TrainGRPC.ControllerResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "Kill"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ControllerRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ControllerResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("Kill"))
                  .build();
          }
        }
     }
     return getKillMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest,
      com.xlabeller.common.module.TrainGRPC.ControllerResponse> getIsUpContainerMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "IsUpContainer",
      requestType = com.xlabeller.common.module.TrainGRPC.ControllerRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ControllerResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest,
      com.xlabeller.common.module.TrainGRPC.ControllerResponse> getIsUpContainerMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest, com.xlabeller.common.module.TrainGRPC.ControllerResponse> getIsUpContainerMethod;
    if ((getIsUpContainerMethod = TrainningGrpc.getIsUpContainerMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getIsUpContainerMethod = TrainningGrpc.getIsUpContainerMethod) == null) {
          TrainningGrpc.getIsUpContainerMethod = getIsUpContainerMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.ControllerRequest, com.xlabeller.common.module.TrainGRPC.ControllerResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "IsUpContainer"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ControllerRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ControllerResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("IsUpContainer"))
                  .build();
          }
        }
     }
     return getIsUpContainerMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest,
      com.xlabeller.common.module.TrainGRPC.ControllerResponse> getIsUpInferenceMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "IsUpInference",
      requestType = com.xlabeller.common.module.TrainGRPC.ControllerRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ControllerResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest,
      com.xlabeller.common.module.TrainGRPC.ControllerResponse> getIsUpInferenceMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ControllerRequest, com.xlabeller.common.module.TrainGRPC.ControllerResponse> getIsUpInferenceMethod;
    if ((getIsUpInferenceMethod = TrainningGrpc.getIsUpInferenceMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getIsUpInferenceMethod = TrainningGrpc.getIsUpInferenceMethod) == null) {
          TrainningGrpc.getIsUpInferenceMethod = getIsUpInferenceMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.ControllerRequest, com.xlabeller.common.module.TrainGRPC.ControllerResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "IsUpInference"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ControllerRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ControllerResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("IsUpInference"))
                  .build();
          }
        }
     }
     return getIsUpInferenceMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.Empty,
      com.xlabeller.common.module.TrainGRPC.ServiceResponse> getServiceListMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "ServiceList",
      requestType = com.xlabeller.common.module.TrainGRPC.Empty.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ServiceResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.Empty,
      com.xlabeller.common.module.TrainGRPC.ServiceResponse> getServiceListMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.Empty, com.xlabeller.common.module.TrainGRPC.ServiceResponse> getServiceListMethod;
    if ((getServiceListMethod = TrainningGrpc.getServiceListMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getServiceListMethod = TrainningGrpc.getServiceListMethod) == null) {
          TrainningGrpc.getServiceListMethod = getServiceListMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.Empty, com.xlabeller.common.module.TrainGRPC.ServiceResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "ServiceList"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.Empty.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ServiceResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("ServiceList"))
                  .build();
          }
        }
     }
     return getServiceListMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.EnrollmentRequest,
      com.xlabeller.common.module.TrainGRPC.EnrollmentResponse> getCustomEnrollmentMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "CustomEnrollment",
      requestType = com.xlabeller.common.module.TrainGRPC.EnrollmentRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.EnrollmentResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.EnrollmentRequest,
      com.xlabeller.common.module.TrainGRPC.EnrollmentResponse> getCustomEnrollmentMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.EnrollmentRequest, com.xlabeller.common.module.TrainGRPC.EnrollmentResponse> getCustomEnrollmentMethod;
    if ((getCustomEnrollmentMethod = TrainningGrpc.getCustomEnrollmentMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getCustomEnrollmentMethod = TrainningGrpc.getCustomEnrollmentMethod) == null) {
          TrainningGrpc.getCustomEnrollmentMethod = getCustomEnrollmentMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.EnrollmentRequest, com.xlabeller.common.module.TrainGRPC.EnrollmentResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "CustomEnrollment"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.EnrollmentRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.EnrollmentResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("CustomEnrollment"))
                  .build();
          }
        }
     }
     return getCustomEnrollmentMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.CustomTrainRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunCustomTrainningMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "RunCustomTrainning",
      requestType = com.xlabeller.common.module.TrainGRPC.CustomTrainRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.CustomTrainRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunCustomTrainningMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.CustomTrainRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunCustomTrainningMethod;
    if ((getRunCustomTrainningMethod = TrainningGrpc.getRunCustomTrainningMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getRunCustomTrainningMethod = TrainningGrpc.getRunCustomTrainningMethod) == null) {
          TrainningGrpc.getRunCustomTrainningMethod = getRunCustomTrainningMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.CustomTrainRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "RunCustomTrainning"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.CustomTrainRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("RunCustomTrainning"))
                  .build();
          }
        }
     }
     return getRunCustomTrainningMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunCustomInferenceMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "RunCustomInference",
      requestType = com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest,
      com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunCustomInferenceMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> getRunCustomInferenceMethod;
    if ((getRunCustomInferenceMethod = TrainningGrpc.getRunCustomInferenceMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getRunCustomInferenceMethod = TrainningGrpc.getRunCustomInferenceMethod) == null) {
          TrainningGrpc.getRunCustomInferenceMethod = getRunCustomInferenceMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest, com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "RunCustomInference"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("RunCustomInference"))
                  .build();
          }
        }
     }
     return getRunCustomInferenceMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest,
      com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse> getAvailableGpuListMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "AvailableGpuList",
      requestType = com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest,
      com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse> getAvailableGpuListMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest, com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse> getAvailableGpuListMethod;
    if ((getAvailableGpuListMethod = TrainningGrpc.getAvailableGpuListMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getAvailableGpuListMethod = TrainningGrpc.getAvailableGpuListMethod) == null) {
          TrainningGrpc.getAvailableGpuListMethod = getAvailableGpuListMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest, com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "AvailableGpuList"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("AvailableGpuList"))
                  .build();
          }
        }
     }
     return getAvailableGpuListMethod;
  }

  private static volatile io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ImageCheckRequest,
      com.xlabeller.common.module.TrainGRPC.ImageCheckResponse> getImageCheckMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "ImageCheck",
      requestType = com.xlabeller.common.module.TrainGRPC.ImageCheckRequest.class,
      responseType = com.xlabeller.common.module.TrainGRPC.ImageCheckResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ImageCheckRequest,
      com.xlabeller.common.module.TrainGRPC.ImageCheckResponse> getImageCheckMethod() {
    io.grpc.MethodDescriptor<com.xlabeller.common.module.TrainGRPC.ImageCheckRequest, com.xlabeller.common.module.TrainGRPC.ImageCheckResponse> getImageCheckMethod;
    if ((getImageCheckMethod = TrainningGrpc.getImageCheckMethod) == null) {
      synchronized (TrainningGrpc.class) {
        if ((getImageCheckMethod = TrainningGrpc.getImageCheckMethod) == null) {
          TrainningGrpc.getImageCheckMethod = getImageCheckMethod = 
              io.grpc.MethodDescriptor.<com.xlabeller.common.module.TrainGRPC.ImageCheckRequest, com.xlabeller.common.module.TrainGRPC.ImageCheckResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "xlabeller.Trainning", "ImageCheck"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ImageCheckRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.xlabeller.common.module.TrainGRPC.ImageCheckResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new TrainningMethodDescriptorSupplier("ImageCheck"))
                  .build();
          }
        }
     }
     return getImageCheckMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static TrainningStub newStub(io.grpc.Channel channel) {
    return new TrainningStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static TrainningBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new TrainningBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static TrainningFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new TrainningFutureStub(channel);
  }

  /**
   */
  public static abstract class TrainningImplBase implements io.grpc.BindableService {

    /**
     */
    public void runTrainning(com.xlabeller.common.module.TrainGRPC.TrainRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getRunTrainningMethod(), responseObserver);
    }

    /**
     */
    public void runInference(com.xlabeller.common.module.TrainGRPC.InferenceRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getRunInferenceMethod(), responseObserver);
    }

    /**
     */
    public void kill(com.xlabeller.common.module.TrainGRPC.ControllerRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getKillMethod(), responseObserver);
    }

    /**
     */
    public void isUpContainer(com.xlabeller.common.module.TrainGRPC.ControllerRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getIsUpContainerMethod(), responseObserver);
    }

    /**
     */
    public void isUpInference(com.xlabeller.common.module.TrainGRPC.ControllerRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getIsUpInferenceMethod(), responseObserver);
    }

    /**
     */
    public void serviceList(com.xlabeller.common.module.TrainGRPC.Empty request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ServiceResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getServiceListMethod(), responseObserver);
    }

    /**
     */
    public void customEnrollment(com.xlabeller.common.module.TrainGRPC.EnrollmentRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.EnrollmentResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getCustomEnrollmentMethod(), responseObserver);
    }

    /**
     */
    public void runCustomTrainning(com.xlabeller.common.module.TrainGRPC.CustomTrainRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getRunCustomTrainningMethod(), responseObserver);
    }

    /**
     */
    public void runCustomInference(com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getRunCustomInferenceMethod(), responseObserver);
    }

    /**
     */
    public void availableGpuList(com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getAvailableGpuListMethod(), responseObserver);
    }

    /**
     */
    public void imageCheck(com.xlabeller.common.module.TrainGRPC.ImageCheckRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ImageCheckResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getImageCheckMethod(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getRunTrainningMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.TrainRequest,
                com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>(
                  this, METHODID_RUN_TRAINNING)))
          .addMethod(
            getRunInferenceMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.InferenceRequest,
                com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>(
                  this, METHODID_RUN_INFERENCE)))
          .addMethod(
            getKillMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.ControllerRequest,
                com.xlabeller.common.module.TrainGRPC.ControllerResponse>(
                  this, METHODID_KILL)))
          .addMethod(
            getIsUpContainerMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.ControllerRequest,
                com.xlabeller.common.module.TrainGRPC.ControllerResponse>(
                  this, METHODID_IS_UP_CONTAINER)))
          .addMethod(
            getIsUpInferenceMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.ControllerRequest,
                com.xlabeller.common.module.TrainGRPC.ControllerResponse>(
                  this, METHODID_IS_UP_INFERENCE)))
          .addMethod(
            getServiceListMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.Empty,
                com.xlabeller.common.module.TrainGRPC.ServiceResponse>(
                  this, METHODID_SERVICE_LIST)))
          .addMethod(
            getCustomEnrollmentMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.EnrollmentRequest,
                com.xlabeller.common.module.TrainGRPC.EnrollmentResponse>(
                  this, METHODID_CUSTOM_ENROLLMENT)))
          .addMethod(
            getRunCustomTrainningMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.CustomTrainRequest,
                com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>(
                  this, METHODID_RUN_CUSTOM_TRAINNING)))
          .addMethod(
            getRunCustomInferenceMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest,
                com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>(
                  this, METHODID_RUN_CUSTOM_INFERENCE)))
          .addMethod(
            getAvailableGpuListMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest,
                com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse>(
                  this, METHODID_AVAILABLE_GPU_LIST)))
          .addMethod(
            getImageCheckMethod(),
            asyncUnaryCall(
              new MethodHandlers<
                com.xlabeller.common.module.TrainGRPC.ImageCheckRequest,
                com.xlabeller.common.module.TrainGRPC.ImageCheckResponse>(
                  this, METHODID_IMAGE_CHECK)))
          .build();
    }
  }

  /**
   */
  public static final class TrainningStub extends io.grpc.stub.AbstractStub<TrainningStub> {
    private TrainningStub(io.grpc.Channel channel) {
      super(channel);
    }

    private TrainningStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected TrainningStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new TrainningStub(channel, callOptions);
    }

    /**
     */
    public void runTrainning(com.xlabeller.common.module.TrainGRPC.TrainRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getRunTrainningMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void runInference(com.xlabeller.common.module.TrainGRPC.InferenceRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getRunInferenceMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void kill(com.xlabeller.common.module.TrainGRPC.ControllerRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getKillMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void isUpContainer(com.xlabeller.common.module.TrainGRPC.ControllerRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getIsUpContainerMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void isUpInference(com.xlabeller.common.module.TrainGRPC.ControllerRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getIsUpInferenceMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void serviceList(com.xlabeller.common.module.TrainGRPC.Empty request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ServiceResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getServiceListMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void customEnrollment(com.xlabeller.common.module.TrainGRPC.EnrollmentRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.EnrollmentResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getCustomEnrollmentMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void runCustomTrainning(com.xlabeller.common.module.TrainGRPC.CustomTrainRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getRunCustomTrainningMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void runCustomInference(com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getRunCustomInferenceMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void availableGpuList(com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getAvailableGpuListMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void imageCheck(com.xlabeller.common.module.TrainGRPC.ImageCheckRequest request,
        io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ImageCheckResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getImageCheckMethod(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   */
  public static final class TrainningBlockingStub extends io.grpc.stub.AbstractStub<TrainningBlockingStub> {
    private TrainningBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private TrainningBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected TrainningBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new TrainningBlockingStub(channel, callOptions);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse runTrainning(com.xlabeller.common.module.TrainGRPC.TrainRequest request) {
      return blockingUnaryCall(
          getChannel(), getRunTrainningMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse runInference(com.xlabeller.common.module.TrainGRPC.InferenceRequest request) {
      return blockingUnaryCall(
          getChannel(), getRunInferenceMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ControllerResponse kill(com.xlabeller.common.module.TrainGRPC.ControllerRequest request) {
      return blockingUnaryCall(
          getChannel(), getKillMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ControllerResponse isUpContainer(com.xlabeller.common.module.TrainGRPC.ControllerRequest request) {
      return blockingUnaryCall(
          getChannel(), getIsUpContainerMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ControllerResponse isUpInference(com.xlabeller.common.module.TrainGRPC.ControllerRequest request) {
      return blockingUnaryCall(
          getChannel(), getIsUpInferenceMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ServiceResponse serviceList(com.xlabeller.common.module.TrainGRPC.Empty request) {
      return blockingUnaryCall(
          getChannel(), getServiceListMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.EnrollmentResponse customEnrollment(com.xlabeller.common.module.TrainGRPC.EnrollmentRequest request) {
      return blockingUnaryCall(
          getChannel(), getCustomEnrollmentMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse runCustomTrainning(com.xlabeller.common.module.TrainGRPC.CustomTrainRequest request) {
      return blockingUnaryCall(
          getChannel(), getRunCustomTrainningMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse runCustomInference(com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest request) {
      return blockingUnaryCall(
          getChannel(), getRunCustomInferenceMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse availableGpuList(com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest request) {
      return blockingUnaryCall(
          getChannel(), getAvailableGpuListMethod(), getCallOptions(), request);
    }

    /**
     */
    public com.xlabeller.common.module.TrainGRPC.ImageCheckResponse imageCheck(com.xlabeller.common.module.TrainGRPC.ImageCheckRequest request) {
      return blockingUnaryCall(
          getChannel(), getImageCheckMethod(), getCallOptions(), request);
    }
  }

  /**
   */
  public static final class TrainningFutureStub extends io.grpc.stub.AbstractStub<TrainningFutureStub> {
    private TrainningFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private TrainningFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected TrainningFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new TrainningFutureStub(channel, callOptions);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> runTrainning(
        com.xlabeller.common.module.TrainGRPC.TrainRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getRunTrainningMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> runInference(
        com.xlabeller.common.module.TrainGRPC.InferenceRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getRunInferenceMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ControllerResponse> kill(
        com.xlabeller.common.module.TrainGRPC.ControllerRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getKillMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ControllerResponse> isUpContainer(
        com.xlabeller.common.module.TrainGRPC.ControllerRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getIsUpContainerMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ControllerResponse> isUpInference(
        com.xlabeller.common.module.TrainGRPC.ControllerRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getIsUpInferenceMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ServiceResponse> serviceList(
        com.xlabeller.common.module.TrainGRPC.Empty request) {
      return futureUnaryCall(
          getChannel().newCall(getServiceListMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.EnrollmentResponse> customEnrollment(
        com.xlabeller.common.module.TrainGRPC.EnrollmentRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getCustomEnrollmentMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> runCustomTrainning(
        com.xlabeller.common.module.TrainGRPC.CustomTrainRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getRunCustomTrainningMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse> runCustomInference(
        com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getRunCustomInferenceMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse> availableGpuList(
        com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getAvailableGpuListMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.xlabeller.common.module.TrainGRPC.ImageCheckResponse> imageCheck(
        com.xlabeller.common.module.TrainGRPC.ImageCheckRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getImageCheckMethod(), getCallOptions()), request);
    }
  }

  private static final int METHODID_RUN_TRAINNING = 0;
  private static final int METHODID_RUN_INFERENCE = 1;
  private static final int METHODID_KILL = 2;
  private static final int METHODID_IS_UP_CONTAINER = 3;
  private static final int METHODID_IS_UP_INFERENCE = 4;
  private static final int METHODID_SERVICE_LIST = 5;
  private static final int METHODID_CUSTOM_ENROLLMENT = 6;
  private static final int METHODID_RUN_CUSTOM_TRAINNING = 7;
  private static final int METHODID_RUN_CUSTOM_INFERENCE = 8;
  private static final int METHODID_AVAILABLE_GPU_LIST = 9;
  private static final int METHODID_IMAGE_CHECK = 10;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final TrainningImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(TrainningImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_RUN_TRAINNING:
          serviceImpl.runTrainning((com.xlabeller.common.module.TrainGRPC.TrainRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>) responseObserver);
          break;
        case METHODID_RUN_INFERENCE:
          serviceImpl.runInference((com.xlabeller.common.module.TrainGRPC.InferenceRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>) responseObserver);
          break;
        case METHODID_KILL:
          serviceImpl.kill((com.xlabeller.common.module.TrainGRPC.ControllerRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse>) responseObserver);
          break;
        case METHODID_IS_UP_CONTAINER:
          serviceImpl.isUpContainer((com.xlabeller.common.module.TrainGRPC.ControllerRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse>) responseObserver);
          break;
        case METHODID_IS_UP_INFERENCE:
          serviceImpl.isUpInference((com.xlabeller.common.module.TrainGRPC.ControllerRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ControllerResponse>) responseObserver);
          break;
        case METHODID_SERVICE_LIST:
          serviceImpl.serviceList((com.xlabeller.common.module.TrainGRPC.Empty) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ServiceResponse>) responseObserver);
          break;
        case METHODID_CUSTOM_ENROLLMENT:
          serviceImpl.customEnrollment((com.xlabeller.common.module.TrainGRPC.EnrollmentRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.EnrollmentResponse>) responseObserver);
          break;
        case METHODID_RUN_CUSTOM_TRAINNING:
          serviceImpl.runCustomTrainning((com.xlabeller.common.module.TrainGRPC.CustomTrainRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>) responseObserver);
          break;
        case METHODID_RUN_CUSTOM_INFERENCE:
          serviceImpl.runCustomInference((com.xlabeller.common.module.TrainGRPC.CustomInferenceRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ReadyStatusResponse>) responseObserver);
          break;
        case METHODID_AVAILABLE_GPU_LIST:
          serviceImpl.availableGpuList((com.xlabeller.common.module.TrainGRPC.AvailableGpuListRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.AvailableGpuListResponse>) responseObserver);
          break;
        case METHODID_IMAGE_CHECK:
          serviceImpl.imageCheck((com.xlabeller.common.module.TrainGRPC.ImageCheckRequest) request,
              (io.grpc.stub.StreamObserver<com.xlabeller.common.module.TrainGRPC.ImageCheckResponse>) responseObserver);
          break;
        default:
          throw new AssertionError();
      }
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public io.grpc.stub.StreamObserver<Req> invoke(
        io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        default:
          throw new AssertionError();
      }
    }
  }

  private static abstract class TrainningBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    TrainningBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.xlabeller.common.module.TrainGRPC.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("Trainning");
    }
  }

  private static final class TrainningFileDescriptorSupplier
      extends TrainningBaseDescriptorSupplier {
    TrainningFileDescriptorSupplier() {}
  }

  private static final class TrainningMethodDescriptorSupplier
      extends TrainningBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    TrainningMethodDescriptorSupplier(String methodName) {
      this.methodName = methodName;
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.MethodDescriptor getMethodDescriptor() {
      return getServiceDescriptor().findMethodByName(methodName);
    }
  }

  private static volatile io.grpc.ServiceDescriptor serviceDescriptor;

  public static io.grpc.ServiceDescriptor getServiceDescriptor() {
    io.grpc.ServiceDescriptor result = serviceDescriptor;
    if (result == null) {
      synchronized (TrainningGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new TrainningFileDescriptorSupplier())
              .addMethod(getRunTrainningMethod())
              .addMethod(getRunInferenceMethod())
              .addMethod(getKillMethod())
              .addMethod(getIsUpContainerMethod())
              .addMethod(getIsUpInferenceMethod())
              .addMethod(getServiceListMethod())
              .addMethod(getCustomEnrollmentMethod())
              .addMethod(getRunCustomTrainningMethod())
              .addMethod(getRunCustomInferenceMethod())
              .addMethod(getAvailableGpuListMethod())
              .addMethod(getImageCheckMethod())
              .build();
        }
      }
    }
    return result;
  }
}

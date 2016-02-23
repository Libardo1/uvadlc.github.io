require 'nn'

local function alexnet_model()
   
    local alexnet = nn.Sequential()

    -- WE GIVE YOU THE FIRST MODULE FOR THIS ALEXNET-LIKE FRAMEWORK
    -- YOU NEED TO IMPLEMENT THE REST OF THE NETWORK
    -- NOT ALL MODULES HAVE TRAINABLE PARAMETERS
    -- ADD THE w_lr (weight learning rate) and b_lr (bias learning rate)
    -- ONLY TO THE MODULES THAT HAVE TRAINABLE PARAMETERS

    -- IN MANY IMPLEMENTATIONS YOU WILL SEE THAT ONE STRICTLY ONLY NEEDS TO 
    -- DEFINE THE MODULE AND ITS INITIAL PARAMETERS
    mod = nn.SpatialConvolution(3, 96, 5, 5, 1, 1, XX, XX)
    -- IN MANY IMPLEMENTATIONS YOU WILL SEE THAT ONE STRICTLY ONLY NEEDS TO 
    -- DEFINE THE MODULE AND ITS INITIAL PARAMETERS. FOR OUR CONVENIENCE WE
    -- CAN INCLUDE FURTHER HELPER VARIABLES THAT PERHAPS WE ARE GOING TO USE NEXT
    
    -- ONE SUCH HELPER VARIABLE IS AN ID/NAME FOR THE MODULE.
    -- WE CAN ASSIGN DIFFERENT NAMES TO MODULES, SO THAT WE CAN DO OUR
    -- ANALYSIS OR DEBUGGING EASIER. E.G. WE MIGHT WANT TO EXCLUDE A SPECIFIC
    -- LAYER WHEN INITIALIZING A NEW LAYER WITH THE WEIGHTS OF AN EXISTING,
    -- PRETRAINED NETWORK

    -- ANOTHER SUCH VARIABLE ARE MODULE LEARNING RATES. IN TORCH YOU CANNOT
    -- EXPLICITLY DEFINE A LEARNING RATE PER MODULE. INSTEAD, YOU CAN DEFINE
    -- A LEARNING RATE VECTOR FOR THE WHOLE VECTOR, WHERE EACH DIMENSION REFERS
    -- TO EACH OF THE PARAMETERS OF THE NETWORK (AS OBTAINED FROM THE FUNCTION 
    -- params, grad_params = model:getParameters()). HENCE, HERE WE CAN DEFINE
    -- A VARIABLE WITH THE INITIAL LEARNING RATE OF THE MODULE. THEN THE LEARNING
    -- RATE SCHEDULE OF THE OPTIMIZATION FUNCTION TAKES CARE OF THE REST.

    -- YOU CAN ADD MORE MODULE HELPER VARIABLES, IF THEY HELP YOU WITH THE 
    -- NETWORK DEFINITION AND TRAINING

    mod.id   = 'conv1'
    mod.w_lr = -- THIS VARIABLE CAN BE COMMENTED OUT IF A UNIQUE LEARNING RATE IS USED FOR THE WHOLE NETWORK
    mod.b_lr = -- THIS VARIABLE CAN BE COMMENTED OUT IF A UNIQUE LEARNING RATE IS USED FOR THE WHOLE NETWORK
    alexnet:add(mod)

    -- TODO

    return alexnet

end

function define_alexnet_model_cifar10()
    model = nn.Sequential()
    -- CONVERT THE MODEL SO THAT IT WORKS WITH CUDA
    model:add(nn.Copy('torch.FloatTensor','torch.CudaTensor'):cuda())
    model:add(alexnet_model():cuda())
    return model
end



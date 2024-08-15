<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use OpenAI\Laravel\Facades\OpenAI;

use function Pest\Laravel\json;
use function Pest\Laravel\post;

class MessageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $filepath = "./public/user_conversation/Conversation" . $request->selectedConversation . $request->get('user_id') . ".json";

        // Check if the file exists and read its contents
        if (Storage::exists($filepath)) {
            $json = json_decode(Storage::get($filepath), true);
        } else {
            $json = [];
        }

        // Create the new message array
        $msg = [
            "role" => $request->get('role'),
            "content" => $request->get('input')
        ];

        // Append the new message to the existing array
        $json[] = $msg;

        $response = OpenAI::chat()->create([
            'model' => 'gpt-4o-mini',
            'messages' => $json,
        ]);

        $jawaban = $response['choices'][0]['message']['content'];

        $msgJawaban = [
            "role" => "assistant",
            "content" => $jawaban
        ];

        // Append the new message to the existing array
        $json[] = $msgJawaban;

        $message = new Message();
        $message->sender = "user";
        $message->message_text = $request->get('input');
        $message->conversation_id = $request->selectedConversation;
        $message->timestamp = now();
        $message->save();

        $message = new Message();
        $message->sender = "assistant";
        $message->message_text = $jawaban;
        $message->conversation_id = $request->selectedConversation;
        $message->timestamp = now();
        $message->save();

        // Encode the array back to JSON and save it
        Storage::put($filepath, json_encode($json, JSON_PRETTY_PRINT));


        return redirect(route('dashboard', absolute: false));
    }

    /**
     * Display the specified resource.
     */
    public function show(Message $message)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Message $message)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Message $message)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Message $message)
    {
        //
    }
}

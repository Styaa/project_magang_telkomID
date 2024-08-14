<?php

namespace App\Http\Controllers;

use App\Models\Conversation;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class ConversationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $conversations = Conversation::where('user_id', Auth::user()->id)->get();
        return response()->json($conversations);
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
        $countData = DB::table('conversations')->count();
        $user = Auth::user();

        $conversation = new Conversation;
        $conversation->title = "Conversation" . ((int) $countData + 1);
        $conversation->user_id = $user->id;
        $conversation->save();

        $jsonMsg = [];
        $jsonString = json_encode($jsonMsg);
        $filename = $conversation->title . $conversation->user_id . ".json";
        $filepath = "./user_conversation/" . $filename;

        Storage::disk('local')->put($filepath, $jsonString);

        return redirect(route('dashboard', absolute: false));
    }

    /**
     * Display the specified resource.
     */
    public function show(Conversation $conversation)
    {
        //
        $messages = Message::where('conversation_id', $conversation->id)->get();
        return response()->json($messages);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Conversation $conversation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Conversation $conversation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Conversation $conversation)
    {
        //
    }
}
